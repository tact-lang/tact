struct Opts {
    op1: Int?;
    op2: Bool?;
    op3: String?;
    op4: Address?;
    op5: Cell?;
}

contract Test {
    rec: Opts;

    init() {
        self.rec = Opts{
            op1: null,
            op2: true,
            op3: "abc",
            op4: null,
            op5: emptyCell(),
        };
    }
}