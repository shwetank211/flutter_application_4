# E-commerce application

An e-commerce application using Provider. 

This application consists of two screens, with navigation between them using the Navigation feature. Below is a detailed description of the application's structure and functionality.

Screen 1: Product Listing Page (Launch Screen)

Purpose: Display a list of products for the user to view and add to the cart.

Product List:
The screen will showcase a list of products (e.g., mobile phones).
The product data will be hardcoded, with a minimum of 10 and a maximum of 20 entries.

Each product row will include:
Product Image: Use any relevant image from the internet. Download the image, store it in the assets folder, and use it in the app.
Product Name: Display the name of the product.
Product Price: Display the price of the product.
Add to Cart Button: An icon button that allows the user to add the product to the cart. Once added, the button should change to display a tick icon and a minus (remove) icon to indicate that the product is in the cart.
App Bar:

The app bar will include a cart icon on the right side.
Clicking this icon will navigate the user to the Cart screen (Screen 2).

Screen 2: Cart Page

Purpose: Display all the products that the user has added to the cart.

Cart Details:
The screen will show the selected products with their image, name, and price.
At the bottom of the screen, there will be a Total Price text displaying the total cost of the items in the cart.
A BUY button will be provided, which when clicked, will clear the cart.

Implementation Details
State Management:
Use Provider for state management to handle the addition and removal of products from the cart.

Data Model:
Create a Product data model that includes the following fields:
image: The image of the product.
name: The name of the product.
price: The price of the product.
Use a list of Product objects in the Provider to manage the cart functionality.

Additional Instructions
Reference: Refer to the session 5 video where the assignment is discussed in detail.
Design: There are no strict design constraints, so feel free to apply your creativity. However, follow the basic structure as outlined above.








