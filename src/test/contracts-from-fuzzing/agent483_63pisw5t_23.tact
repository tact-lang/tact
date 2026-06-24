struct FlatDivers {
    i: Int;
    b: Bool;
    s: String;
    op: Int?;
    ob: Bool?;
    os: String?;
    addr: Address;
    oaddr: Address?;
}

contract DiverseFlat {
    data: FlatDivers;

    init() {
        self.data = FlatDivers{
            i: 1,
            b: true,
            s: "hi",
            op: null,
            ob: null,
            os: null,
            addr: myAddress(),
            oaddr: null,
        };
    }
}
