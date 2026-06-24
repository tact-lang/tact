contract A {
    receive() {}
}

contract TestInitValid {
    receive() {
        let init = initOf A();
    }
}
