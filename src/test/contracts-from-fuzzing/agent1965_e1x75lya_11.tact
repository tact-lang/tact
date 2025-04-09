struct SOpt {
    text: String?;
    another: Int?;
}

contract OptStruct {
    s: SOpt;
    init() {
        self.s = SOpt{ text: null, another: null };
    }
}