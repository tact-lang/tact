contract Test {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Address?;
    f: String?;

    init() {}

    get fun getA(): Int? {
        return self.a;
    }
}
