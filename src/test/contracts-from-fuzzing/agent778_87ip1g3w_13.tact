struct DefaultStruct {
    x: Int = 5;
    y: Bool = true;
}

contract StructWithDefaults {
    data: DefaultStruct;
    init() {
        self.data = DefaultStruct{};
    }
}