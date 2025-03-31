contract J(param: Int) {}

contract K {
    receive() {
        // Test valid usage of initOf with trailing comma for contract with parameters
        let s: StateInit = initOf J(555,);
    }
}
