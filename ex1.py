import torch
import torch.nn as nn
import matplotlib.pyplot as plt

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.hidden_layer = nn.Linear(1, 10)  # 1 input feature, 10 hidden units
        self.output_layer = nn.Linear(10, 1)  # 10 hidden units, 1 output

    def forward(self, x):
        x = torch.relu(self.hidden_layer(x))
        x = self.output_layer(x)
        return x

# Define the function I want to approximate
def function(x):
    if x < -2:
        return -x - 2
    elif -2 <= x < -1:
        return x + 2
    elif -1 <= x < 0:
        return -x
    else:
        return x

# Instantiate the model
model = Net()

# Define the loss function (Mean Squared Error)
loss_function = nn.MSELoss()

# Define the optimizer
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)

# Training loop to fit the model to the provided function
for epoch in range(10000):
    optimizer.zero_grad()  # Zero the gradients
    x_train = torch.unsqueeze(torch.linspace(-3, 3, 100), dim=1)  # Generate training data
    y_train = torch.tensor([function(x) for x in x_train], dtype=torch.float32).unsqueeze(dim=1)
    output = model(x_train)  # Forward pass
    loss = loss_function(output, y_train)  # Calculate the loss
    loss.backward()  # Backward pass
    optimizer.step()  # Update weights

    if epoch % 1000 == 0:
        print(f'Epoch {epoch}, Loss: {loss.item()}')

# Test the model
test_input = torch.tensor([[-2.5], [-1.5], [-0.5], [0.5]], dtype=torch.float32)

# Plotting
with torch.no_grad():
    x = torch.linspace(-3, 3, 1000).unsqueeze(1)
    predicted_output = model(x)
    plt.plot(x.numpy(), predicted_output.numpy(), label='Prediction')
    plt.plot(x.numpy(), [function(xi) for xi in x.numpy()], label='Function')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title('Function vs Prediction')
    plt.legend()
    plt.show()
