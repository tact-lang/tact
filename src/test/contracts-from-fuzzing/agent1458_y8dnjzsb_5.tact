struct Foo {
    a: Int;
}

contract Test {
    opt: Foo?;

    init() {
        self.opt = null;
    }
}