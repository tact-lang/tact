contract B(param: Int) {
    receive() {}
}

contract Test {
    get fun test(): StateInit {
        // Valid usage of initOf for a contract with parameters
        return initOf B(123);
    }
}
