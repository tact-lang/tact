struct Foo {
    x: Int;
    y: Bool;
}

contract Opts {
    f: Foo?;
    init() {
        self.f = null;
    }
}