struct InnerOptionalPrims {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract NestedOptionalPrims {
    data: InnerOptionalPrims;

    init() {
        self.data = InnerOptionalPrims{ a: null, b: null, c: null, d: null };
    }
}