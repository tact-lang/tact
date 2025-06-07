struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalStructVar {
    n: NestedOptionals?;
    init() {
        self.n = null;
    }
}
