struct ComplexOptional {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract NestedComplexOptional {
    one: ComplexOptional?;
    two: ComplexOptional?;

    init() {
        self.one = null;
        self.two = ComplexOptional{
            s: "hi",
            i: 33,
            b: true
        };
    }
}