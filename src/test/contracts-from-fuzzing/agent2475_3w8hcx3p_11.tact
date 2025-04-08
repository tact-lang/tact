struct PrimitiveOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract AllOptionalPrimitives {
    ps: PrimitiveOpt;
    init() {
        self.ps = PrimitiveOpt{ i:null, b:null, s:"test" };
    }
}