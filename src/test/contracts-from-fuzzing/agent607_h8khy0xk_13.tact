struct SOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract MultiOptionStruct {
    s: SOpt;

    init() {
        self.s = SOpt{ a: null, b: null, c: true };
    }
}