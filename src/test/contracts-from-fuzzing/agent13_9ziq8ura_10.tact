struct Inner1 { a: Int; b: Bool }
struct Inner2 { c: Int?; d: Bool? }
struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract NestedMix {
    combined: Outer;

    init() {
        self.combined = Outer{
            i1: Inner1{ a: 1, b: true },
            i2: Inner2{ c: null, d: null }
        };
    }
}