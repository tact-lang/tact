struct BothOpt {
    n: Int?;
    b: Bool?;
    s: String?;
}

contract Test {
    field: BothOpt;

    init() {
        self.field = BothOpt{
            n: null,
            b: null,
            s: null
        };
    }
}