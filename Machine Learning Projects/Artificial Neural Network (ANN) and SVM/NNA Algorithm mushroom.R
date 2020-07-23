#Nueral Network algorithm 

mushroom_ann <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data",
                          na.strings="?", sep = "," )
str(mushroom_ann)
#Rename the variables (colums), wo we have names for each column 
colnames(mushroom_ann) <- c("edibility", "cap_shape", "cap_surface", "cap_color", "bruises", "odor",
                           "grill_attachement", "grill_spacing", "grill_size", "grill_color", 
                           "stalk_shape", "stalk_root", "stalk_surface_above_ring", 
                           "stalk_surface_below_ring", "stalk_color_above_ring",
                           "stalk_color_below_ring", "veil_type", "veil_color", 
                           "ring_number", "ring_type", "spore_print_color", "population", "habitat")
str(mushroom_ann)
summary(mushroom_ann)
mushroom_ann <- subset(mushroom_ann, select = -veil_type) #removing the column with 1 level (veil_type)

sum(is.na(mushroom_ann))
#mushroom[ mushroom == "u" ] <- NA
levels <- levels(mushroom_ann$stalk_root)
levels[length(levels) + 1] <- "U"
mushroom_ann$stalk_root <- factor(mushroom_ann$stalk_root, levels = levels)
mushroom_ann$stalk_root[is.na(mushroom_ann$stalk_root)] <-"U"
summary(mushroom_ann)
sum(is.na(mushroom_ann))

#creating train and test sets and converting into dummy variables
splitting <- createDataPartition(mushroom_ann$edibility, p = .7, list = FALSE) #splitting data into 70/30
dummy <- subset(mushroom_ann, select = -edibility)
mush_ann_dummy <- dummyVars(~., data = dummy, sep = ".") #creating a full set of dummy variables
mush_ann_dummy <- data.frame(predict(mush_ann_dummy, dummy))
mush_ann_dummy$edibility <- mushroom_ann$edibility #dummy vars of edibility

train_ann <- mush_ann_dummy[splitting,] #split into .7
test_ann <- mush_ann_dummy[-splitting,] #split into .3
testLabels <- subset(test_ann, select = edibility) #selecting variables from edibility 
testset <- subset(test_ann, select = -edibility) #creating tetsset of edibility

#using library nnet to construct the ANN
net <- nnet(edibility ~ ., data = train_ann, size = 2, rang = 0.1, maxit = 200) #train the neural network with nnet
summary(net) #obtain information about the trained neural network

#prediction ann
mush_ann.predict <- predict(net, testset, type = "class") #Generate the predictions of the testing dataset based on the model
net.table <- table(test_ann$edibility, mush_ann.predict) #Generate a classification table based on the predicted labels and labels of the testing dataset
net.table
confusionMatrix(net.table) # generate a confusion matrix based on the classification table
