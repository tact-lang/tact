struct DefaultStruct {
    x: Int = 5;
    y: Int = 10;
}

contract DefaultStructField {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}