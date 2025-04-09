struct NestedDefaults {
    foo: Int = 5;
    bar: Bool?;
}

contract TestDefaults {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            bar: null,
        };
    }
}