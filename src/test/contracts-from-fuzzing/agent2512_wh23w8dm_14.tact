struct DefaultStruct {
    x: Int = 10;
    y: Bool = true;
    z: String = "default";
}

contract StructWithDefaults {
    val: DefaultStruct;

    init() {
        self.val = DefaultStruct{};
    }
}