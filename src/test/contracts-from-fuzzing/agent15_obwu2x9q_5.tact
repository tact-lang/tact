struct InnerWithDefaults {
    foo: Int = 42;
    bar: Bool = true;
}

contract StructDefaults {
    data: InnerWithDefaults;

    init() {
        self.data = InnerWithDefaults{};
    }
}