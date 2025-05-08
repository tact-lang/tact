contract A {
    x: Int;

    init(x: Int) {
        self.x = x;
    }

    receive() {}
}

contract Test1 {
    receive() {
        let init_a = initOf A(42);
        let code_a = codeOf A;
    }
}
