contract B(x: Int) {}

contract TestParams {
    // Valid call for a contract with a parameter
    get fun test_init(): StateInit {
         return initOf B(123);
    }
    
    // Valid call to get the code cell for a parameterized contract
    get fun test_code(): Cell {
         return codeOf B;
    }
    
    receive() {}
}
