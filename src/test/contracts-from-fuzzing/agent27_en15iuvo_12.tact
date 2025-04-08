struct ZeroField {
    a: Int = 0;
}

contract DefaultStruct {
    st: ZeroField;

    init() {
        self.st = ZeroField{};
    }
}