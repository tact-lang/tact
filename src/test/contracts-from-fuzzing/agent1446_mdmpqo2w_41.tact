contract Combo {
    a: Int as uint4 = 7;
    b: Int as int8 = -5;
    c: Bool = true;
    d: Int?;

    init() {
        self.d = 123;
    }
}
