struct BigOptionalGroup {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OnlyBigOptGroup {
    optdata: BigOptionalGroup;

    init() {
        self.optdata = BigOptionalGroup{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}