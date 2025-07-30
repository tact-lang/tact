struct InnerWithDefaults {
    x: Int = 7;
    s: String = "hi";
    b: Bool = true;
}

contract StructWithDefaults {
    data: InnerWithDefaults;

    init() {
        self.data = InnerWithDefaults{};
    }
}