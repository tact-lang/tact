contract B(param: Int) { }

contract TestInitParams {
    receive() {
        // Valid usage of initOf with a contract with parameters
        let state = initOf B(42);
    }
}
