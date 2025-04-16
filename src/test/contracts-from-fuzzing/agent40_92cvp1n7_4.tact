struct DefaultStruct {
    x: Int = 7;
    flag: Bool = false;
    optionalText: String?; // implicitly null
}

contract WithDefaults {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}