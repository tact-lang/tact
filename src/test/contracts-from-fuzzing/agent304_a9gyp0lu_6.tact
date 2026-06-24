struct DefaultStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Slice; // without default, should be initialized
    e: Int?; // default null
}

contract DefaultFields {
    data: DefaultStruct;
    init() {
        self.data = DefaultStruct{
            d: emptyCell().asSlice(),
        };
    }
}
