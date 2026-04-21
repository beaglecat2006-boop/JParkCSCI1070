import pandas as pd
import torch

diabetes_df=pd.read_csv("../week_06/diabetes.csv")
diabetes_df.head()

#from Optimizer app

for pregnancies, target in diabetes_df:
    optimizer.zero_grad()
    output = model(input)
    loss = loss_fn(output, target)
    loss.backward()
    optimizer.step()

for input, target in dataset:
    def closure():
        optimizer.zero_grad()
        output = model(input)
        loss = loss_fn(output, target)
        loss.backward()
        return loss
    optimizer.step(closure)


optimizer.zero.grad() #zeros the gradient before running backward propagation
loss.backward() #working to minimize the loss function using backward propagation
optimizer.step() #perform one optimization step each function

#This is for Optimizer App-- for Quiz problem see the code right below(It worked when I tried import torch.nn as nn and not import torch
It is glad that it worked but I am still not sure why it worked when I tried torch.nn and not torch)

import torch.nn as nn

model = nn.Linear(8, 1) 

loss_fn = torch.nn.MSELoss() 
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)

X = torch.tensor(diabetes_df.iloc[:, 0:8].values).float()
y = torch.tensor(diabetes_df.iloc[:, 8].values).float().unsqueeze(1)
dataset = TensorDataset(X, y)

for input, target in dataset:
    optimizer.zero_grad()
    output = model(input.unsqueeze(0)) 
    loss = loss_fn(output, target)
    loss.backward()
    optimizer.step()
