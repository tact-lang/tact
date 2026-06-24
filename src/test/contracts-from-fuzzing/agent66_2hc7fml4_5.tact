contract A {
    receive() {}
}

contract Test {
    receive() {
        let s: StateInit = initOf A();
    }
}
