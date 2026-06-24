struct Combo {
    a: Int as int16;
    b: Int?;
    c: Bool?;
}

contract TestContract {
    data: Combo;
    init() {
        self.data = Combo{ a: -1234, b: null, c: null };
    }
}