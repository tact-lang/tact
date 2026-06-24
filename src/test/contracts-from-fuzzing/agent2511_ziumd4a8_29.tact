struct Simple {
    a: Int;
}

contract FieldAlias {
    foo: Simple;
    bar: Simple;

    init() {
        self.foo = Simple{a: 1};
        self.bar = Simple{a: 2};
    }
}