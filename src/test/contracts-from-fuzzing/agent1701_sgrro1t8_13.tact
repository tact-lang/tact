struct MixedNulls {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract InitNulls {
    data: MixedNulls;

    init() {
        self.data = MixedNulls{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null
        };
    }
}