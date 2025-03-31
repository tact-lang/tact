contract B(param: Int) {
    // Implicit empty init() function
    receive() {}
}

contract TestValid {
    receive() {
        let s: StateInit = initOf B(42);
        let c: Cell = codeOf B;
    }
}
