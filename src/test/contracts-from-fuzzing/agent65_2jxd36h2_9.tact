// Test Case 3: Using a contract with parameters
contract B(x: Int) {
    receive() {}
}

contract Test {
    receive() {
       // Using initOf with contract B which takes a parameter
       let s: StateInit = initOf B(123);
       // Retrieve code of contract B
       let c: Cell = codeOf B;
       // Compute the address using the initial state
       let addr: Address = contractAddress(s);
       addr;
       c;
    }
}
