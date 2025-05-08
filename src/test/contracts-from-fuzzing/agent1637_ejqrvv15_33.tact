// test optional builder
contract OptionalBuilder {
    foo: Builder?;

    init() {
        self.foo = beginCell();
    }
}