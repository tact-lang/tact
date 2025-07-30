struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStruct {
    s: SOpt;

    init() {
        self.s = SOpt{a: 5, b: null, c: "hi"};
    }
}