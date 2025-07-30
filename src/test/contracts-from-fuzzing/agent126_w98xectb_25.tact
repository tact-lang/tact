struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptCombo {
    m: MultiOpt;

    init() {
        self.m = MultiOpt{ a:null, b:null, c:null, d:null };
    }
}