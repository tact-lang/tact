contract A {
    x: Int;
    init(x: Int) {
        self.x = x;
    }
    receive() {}
}

contract Test {
    receive() {
        let s = initOf A(42);
    }
}
