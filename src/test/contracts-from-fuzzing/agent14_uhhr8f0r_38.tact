struct Embed {
    p: Int;
}

contract Test {
    foo: Embed;

    init() {
        self.foo = Embed { p: 1 };
    }
}