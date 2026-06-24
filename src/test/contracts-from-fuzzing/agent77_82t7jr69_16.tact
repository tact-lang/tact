struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract TestContract {
    large_optional: ManyOpts? = null;
    init() {}
}