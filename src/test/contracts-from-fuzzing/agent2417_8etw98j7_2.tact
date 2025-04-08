struct NestedOptional {
    flag: Bool?;
    data: Int?;
}

contract NestedStructContract {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{ flag: true, data: 42 };
    }
}
