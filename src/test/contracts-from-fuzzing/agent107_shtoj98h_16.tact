struct DefaultStruct {
    x: Int = 1;
    y: Bool = true;
}

contract DefaultValue {
    data: DefaultStruct;

    init() {
        self.data = DefaultStruct{};
    }
}
