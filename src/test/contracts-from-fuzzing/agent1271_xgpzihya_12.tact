contract NullOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: String?;
    init() {
        // leave all unset, should be null implicit
    }
    receive() {}
}