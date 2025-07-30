/* Test Case 3: Valid usage of initOf for a contract with contract parameters */
contract B(x: Int) {}

contract TestBValid {
    receive() {
         let state = initOf B(42);
    }
}
