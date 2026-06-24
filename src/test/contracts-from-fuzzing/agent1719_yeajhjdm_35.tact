struct InnerS {
    a: Int;
    b: Bool?;
}
contract StructWithOptInside {
    s: InnerS;
    
    init() {
        self.s = InnerS{
            a: 3,
            b: null
        };
    }
}