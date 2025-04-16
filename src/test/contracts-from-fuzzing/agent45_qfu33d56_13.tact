struct EmbeddedOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    bl: Builder?;
}

contract ContractWithOptionalEmbedded {
    data: EmbeddedOptionals;

    init() {
        self.data = EmbeddedOptionals{
            i:null, b:true, s:null, a:null, c:null, sl:null, bl:null
        };
    }
}