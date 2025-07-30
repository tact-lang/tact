struct NestedBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract ManyBools {
    bools: NestedBools;

    init() {
        self.bools = NestedBools{ a: true, b: false, c: true, d: false };
    }
}