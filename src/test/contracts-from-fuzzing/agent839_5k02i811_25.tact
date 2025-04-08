struct Bar { x: Int }
contract InitNoDefault {
    foo: Bar;
    init() {
        self.foo = Bar{ x: 42 };
    }
}