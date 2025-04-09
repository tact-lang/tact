struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract WithMultiOpt {
    f: MultiOpt = MultiOpt{a:null, b:null, c:null, d:null, e:null, f:null};
}