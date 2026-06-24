struct PartiallyDefaulted {
    a: Int;
    b: Int = 5;
    c: Int = 7;
}

contract DefaultFields {
    s: PartiallyDefaulted;
    init() {
        self.s = PartiallyDefaulted{ a: 42 };
    }
}