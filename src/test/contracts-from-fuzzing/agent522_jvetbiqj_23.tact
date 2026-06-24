struct InA {
    foo: Int;
    bar: Int;
}

struct InB {
    baz: Int;
    qux: Int;
}

struct Pair {
    left: InA;
    right: InB;
}

contract TwoStructs {
    pair: Pair;

    init() {
        self.pair = Pair{
            left: InA{ foo: 1, bar: 2 },
            right: InB{ baz:3, qux:4 },
        };
    }
}