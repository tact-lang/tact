/* Test Case 2: Valid usage with contract parameters and using codeOf as a standalone statement */

contract B(param: Int) {
    // No init() is defined because contract parameters are used
}

contract TestB {
    receive() {
         // Using initOf with parameter for contract B
         let si: StateInit = initOf B(123);
         // Using codeOf as a standalone expression; its value is ignored,
         // but should compile without error
         codeOf B;
    }
}
