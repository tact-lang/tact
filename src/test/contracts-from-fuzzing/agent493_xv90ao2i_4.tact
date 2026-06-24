struct DefaultStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract WithDefaults {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}