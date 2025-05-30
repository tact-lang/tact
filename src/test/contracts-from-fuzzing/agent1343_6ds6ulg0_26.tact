struct DefaultStruct {
    a: Int = 1;
    b: Bool = false;
}

contract DefaultStructInside {
    field: DefaultStruct;

    init() {
        self.field = DefaultStruct{};
    }
}
