struct DefaultStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract StructWithDefaults {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}