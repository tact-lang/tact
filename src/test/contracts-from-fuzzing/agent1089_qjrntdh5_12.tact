struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract LargeOptional {
    opts: ManyOpts = ManyOpts{};
}