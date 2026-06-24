struct DefaultOpt {
    a: Int?;
    b: String?;
    c: Cell?;
}

contract Test7 {
    s: DefaultOpt;

    init() {
        self.s = DefaultOpt{ a: null, b: null, c: null };
    }
}