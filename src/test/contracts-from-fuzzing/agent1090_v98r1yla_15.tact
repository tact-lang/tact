struct MostlyNull {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;
}

contract NullStructs {
    s: MostlyNull?;

    init() {
        self.s = null;
    }
}