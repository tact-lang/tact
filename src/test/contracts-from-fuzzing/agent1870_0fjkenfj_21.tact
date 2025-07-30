struct InnerWithDefault {
    num: Int = 42;
    text: String = "default";
}

contract StructWithDefaults {
    data: InnerWithDefault;

    init() {
        self.data = InnerWithDefault{};
    }
}
