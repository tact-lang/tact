struct StructWithDefault {
    x: Int = 42;
    y: Bool = true;
    s: String = "default";
}

contract TestStructWithDefault {
    f: StructWithDefault;
    init() {
        self.f = StructWithDefault{};
    }
}