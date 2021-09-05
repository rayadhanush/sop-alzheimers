Link to dataset - https://www.kaggle.com/tourist55/alzheimers-dataset-4-class-of-images
## VMD Processing
The function ***vmdFn(inputFolder, outputFolder, vmdParams)*** performs vmd on each image in the *inputFolder* and saves all the imfs to *outputFolder*.

**Syntax:**
```
inputFolder = 'C:\Users\username\Documents\SOP-Alzheimers\Alzheimer_s Dataset\train\MildDemented\';
outputFolder = 'C:\Users\username\Documents\SOP-Alzheimers\imfs\train\MildDemented\';
vmdParams = {100, 0.1, 4, false, 0, 0.0000001};
vmdFn(inputFolder, outputFolder, vmdParams);
```
