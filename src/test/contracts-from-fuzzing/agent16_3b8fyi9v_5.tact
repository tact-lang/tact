contract A {
    receive() {}
}

contract TestInitValid {
    receive() {
        let s: StateInit = initOf A();
    }
}
