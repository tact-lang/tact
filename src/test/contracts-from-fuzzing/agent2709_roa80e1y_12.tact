struct Child {
    foo: Int;
    bar: Bool;
}

contract OptionalNested {
    ch: Child?;

    init() {
        self.ch = null;
    }
}