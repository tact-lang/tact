struct Duplicate {
    foo: Int;
    bar: Bool?;
}

contract DoubleEmbed {
    s1: Duplicate;
    s2: Duplicate?;

    init() {
        self.s1 = Duplicate{ foo: 5, bar: null };
        self.s2 = Duplicate{ foo: 42, bar: false };
    }
}