struct DefaultStruct {
    x: Int = 5;
    y: Bool = true;
}

contract UsesDefaults {
    d: DefaultStruct;

    init() {
        self.d = DefaultStruct{};
    }
}