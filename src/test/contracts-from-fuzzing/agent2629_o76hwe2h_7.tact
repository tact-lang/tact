struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptInStruct {
    nested: NestedOpt = NestedOpt{
        a: null,
        b: null,
        c: null,
        d: null
    };

    init() {}
}