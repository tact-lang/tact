struct Nested {
    s: Int?;
}

contract Wrap {
    foo: Nested?;
    init() {
        self.foo = null;
    }
}