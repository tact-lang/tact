struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    m: MultiOpt;
    init() {
        self.m = MultiOpt{ a: null, b: null, c: null };
    }
}