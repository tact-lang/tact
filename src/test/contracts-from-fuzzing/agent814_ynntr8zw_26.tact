struct InnerDefault {
    a: Int = 5;
    b: Bool = false;
}

contract StructWithDefaults {
    data: InnerDefault;

    init() {
        self.data = InnerDefault{};
    }
}