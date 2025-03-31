contract A { }

contract TestInitValid {
    receive() {
        // Valid usage of initOf with a contract with no parameters
        let state = initOf A();
    }
}
