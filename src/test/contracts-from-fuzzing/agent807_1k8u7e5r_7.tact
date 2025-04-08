struct DefaultStruct {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";
}

contract StructDefaults {
    field: DefaultStruct;
    init() {
        self.field = DefaultStruct{};
    }
}