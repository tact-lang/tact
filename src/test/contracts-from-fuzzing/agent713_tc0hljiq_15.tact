struct DefaultStruct {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultVals {
    s: DefaultStruct;
    init() {
        self.s = DefaultStruct{};
    }
}