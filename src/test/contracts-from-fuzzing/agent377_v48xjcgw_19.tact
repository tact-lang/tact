message(9) Foo { x: Int; }

contract TestContract {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}