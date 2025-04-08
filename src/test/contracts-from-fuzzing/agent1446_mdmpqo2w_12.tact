struct OpOp {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract Test {
    data: OpOp;

    init() {
        self.data = OpOp{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}
