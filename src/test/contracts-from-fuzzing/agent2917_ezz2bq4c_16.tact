struct OptionalDeep {
    foo: Nested?;
}

struct Nested {
    val: Int;
    msg: String;
}

contract OptionalNestedField {
    hold: OptionalDeep;

    init() {
        self.hold = OptionalDeep{foo: Nested{val: 42, msg: "hi"}};
    }
}
