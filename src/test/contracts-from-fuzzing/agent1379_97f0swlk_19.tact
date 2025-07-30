struct UU {
    x: Int;
}

contract NullableStruct {
    maybe: UU?;

    init() {
        self.maybe = UU{ x: 123 };
    }
}
