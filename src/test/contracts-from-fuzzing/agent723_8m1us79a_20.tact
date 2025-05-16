struct Foo {
    q: Int;
    w: Bool;
}

contract TestContract {
    s: Foo?;

    init() {
        self.s = Foo{
            q: 99,
            w: true,
        };
    }

    receive() {}
}