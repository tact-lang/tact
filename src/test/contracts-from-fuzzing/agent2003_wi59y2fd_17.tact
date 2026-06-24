struct ManyOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    val: ManyOpt;

    init() {
        self.val = ManyOpt{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
