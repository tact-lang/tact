struct Bar { a: Int; }

contract DoubleInit {
    foo: Bar;
    init() {
        self.foo = Bar{a:1};
        self.foo = Bar{a:2};
    }
}