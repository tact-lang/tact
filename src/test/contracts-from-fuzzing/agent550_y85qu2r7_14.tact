struct MixedOpt {
    a: Int; 
    b: String?;
    c: Bool;
    d: Address?;
    e: Int?;
}

contract MixedOpts {
    field: MixedOpt;

    init() {
        self.field = MixedOpt{
            a: 1, b: null, c: true, d: null, e: null
        };
    }
}