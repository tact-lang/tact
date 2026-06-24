struct InnerOpt {
    score: Int as uint4 = 5;
    text: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool? = false;
}

contract OptSerialCombo {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{ inner: null };
    }
}