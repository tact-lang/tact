struct InnerWithDefaults {
    x: Int = 5;
    y: Bool = true;
}

contract DefaultFieldStruct {
    s: InnerWithDefaults;

    init() {
        self.s = InnerWithDefaults{};
    }
}