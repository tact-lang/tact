struct ZeroSizeNested {
    a: Int = 1;
    b: Bool = false;
}

contract NestedWithDefaults {
    nested: ZeroSizeNested;

    init() {
        self.nested = ZeroSizeNested{};
    }
}