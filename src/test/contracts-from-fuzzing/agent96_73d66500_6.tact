contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let s: StateInit = initOf A();
    }
}
