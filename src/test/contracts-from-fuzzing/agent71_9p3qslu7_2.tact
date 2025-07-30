contract A {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let state = initOf A();
    }
}
