struct SOpt {
    i: Int?;
    b: Bool?;
}

contract OptionalOnly {
    a: SOpt;
    init() {
        self.a = SOpt{ i:null, b:null };
    }
}
