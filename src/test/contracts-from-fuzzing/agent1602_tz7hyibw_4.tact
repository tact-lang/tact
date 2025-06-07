struct NestedWithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";
    d: Address;
}

contract DefaultsInsideNested {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            d: myAddress(),
        };
    }
}
