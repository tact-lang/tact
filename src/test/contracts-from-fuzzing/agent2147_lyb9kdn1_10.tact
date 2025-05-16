struct ManyOpts {
    x: Int?;
    y: Bool?;
    z: Cell?;
    s: Slice?;
    a: Address?;
    t: String?;
}

contract OptStruct {
    many: ManyOpts = ManyOpts{};
}