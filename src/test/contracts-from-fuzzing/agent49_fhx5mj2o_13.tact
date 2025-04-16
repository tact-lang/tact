// Test case 1: Valid usage with a contract that has a parameter
contract B(param: Int) {
    receive() {}
}

contract TestB {
    receive() {
         // Direct usage as standalone statements
         initOf B(100);
         codeOf B;
    }
}
