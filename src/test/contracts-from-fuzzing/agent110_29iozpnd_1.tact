contract A {
    init(x: Int) {
        // no-op
    }
    receive() {}
}

contract Test {
    receive() {
        let s = initOf A(42);
    }
}
