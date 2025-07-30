struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}
struct Inner3 {
    c: Slice;
}

struct ComplexNested {
    x: Inner1;
    y: Inner2;
    z: Inner3;
}

contract ComplexFields {
    nested: ComplexNested;

    init() {
        self.nested = ComplexNested{
            x: Inner1{a: 10},
            y: Inner2{b: false},
            z: Inner3{c: emptyCell().asSlice()}
        };
    }
}