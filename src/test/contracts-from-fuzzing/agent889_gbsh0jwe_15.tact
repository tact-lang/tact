struct StructWithDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "test";
}

contract UsesDefaultedStruct {
    s: StructWithDefault;

    init() {
        self.s = StructWithDefault{};
    }
}