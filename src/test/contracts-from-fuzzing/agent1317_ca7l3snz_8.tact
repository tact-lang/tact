struct DefaultStruct {
    x: Int = 5;
    y: Bool = true;
}

contract WithDefaults {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}