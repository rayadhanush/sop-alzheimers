function [statusMessage] = vmdFn(inputFolder, outputFolder, vmdParams)

% assign vmd param variables
[alpha, tau, K, DC, init, to1] = deal(vmdParams{:});

% check for input folder
if ~isfolder(inputFolder)
  statusMessage = 'Error: Input folder does not exist';    
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', inputFolder);
  uiwait(warndlg(errorMessage));
  return;
end

% create output folder
if ~isfolder(outputFolder)
  mkdir(outputFolder);
end

% get all jpg files in input folder
imgFiles = dir(fullfile(inputFolder, '*.jpg'));
formatSplitter = '\.';

for k = 1:length(imgFiles)
  imgFileName = fullfile(inputFolder, imgFiles(k).name);
  fprintf(1, 'Now reading -  %s\n', imgFileName);
  img = imread(imgFileName);
  vmdResult = VMD_2D(img, alpha, tau, K, DC, init, to1);
  for i = 1:K
    imf = uint8(255 * mat2gray(vmdResult(:, :, i)));
    imf = imresize(imf, [150 150]);
    imgName = regexp(imgFiles(k).name, formatSplitter, 'split');
    opFileName = append(outputFolder, char(imgName(1)), '-imf', num2str(i), '.png');
    imwrite(imf, opFileName);
  end
end

statusMessage = 'All input images have been processed';
end

