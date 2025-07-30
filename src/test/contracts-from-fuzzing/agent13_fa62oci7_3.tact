struct Wrap {
    i: Int;
}

contract OptionalFieldTest {
    foo: Wrap?;

    init() {
        self.foo = null;
    }
}