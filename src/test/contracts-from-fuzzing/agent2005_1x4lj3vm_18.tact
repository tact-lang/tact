struct MixedOpt {
    a: Int; b: Int?;
    c: Bool; d: Bool?;
    e: Address; f: Address?;
}

contract MixedOptionalFields {
    vals: MixedOpt;

    init() {
        self.vals = MixedOpt{
            a:1, b:null,
            c:true, d:null,
            e:myAddress(), f:null
        };
    }
}