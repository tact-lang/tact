struct Foo {
    a: Int;
    b: Bool = false;
}

contract Test {
    opt: Foo?;

    init() {
        self.opt = null;
    }
}