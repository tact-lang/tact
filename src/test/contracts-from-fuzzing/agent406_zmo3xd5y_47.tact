struct NameWrap {
    foo: Int;
}

contract FieldReuse {
    foo: Int;
    wrap: NameWrap;

    init() {
        self.foo = 1;
        self.wrap = NameWrap{ foo:2 };
    }
}