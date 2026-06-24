struct DefaultStruct {
    x: Int = 7;
    y: Bool = true;
}

contract StructWithDefaults {
    field: DefaultStruct;
    init() {
        self.field = DefaultStruct{};
    }
}