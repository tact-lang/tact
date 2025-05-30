struct A {
    a: Int;
    b: String;
}

contract InlineAssign {
    s: A;
    init() {
        self.s = A{ a:10, b:"q" };
    }
}