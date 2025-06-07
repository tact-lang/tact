contract A {
    var: Int;
    init() {
        self.var = 42;
    }
    receive() {}
}

contract Test1 {
    receive() {
        let codeA = codeOf A;
        let initA = initOf A();
    }
}
