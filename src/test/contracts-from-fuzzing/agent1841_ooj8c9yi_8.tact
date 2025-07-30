struct StructWithDefault {
    x: Int = 10;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultStruct {
    s: StructWithDefault;

    init() {
        self.s = StructWithDefault{};
    }
}
