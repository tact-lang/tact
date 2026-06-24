contract A {
    receive() {}
}

contract TestValid {
    receive() {
        // Valid usage of initOf and codeOf
        let state: StateInit = initOf A();
        let code: Cell = codeOf A;
    }
}
