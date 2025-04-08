struct Nested {
    nestedFlag: Bool;
    nestedVal: Int;
}

contract NestedStructContract {
    info: Nested;

    init() {
        self.info = Nested{ nestedFlag: false, nestedVal: 123 };
    }
}
