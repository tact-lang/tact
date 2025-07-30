struct Inner1 { x: Int; y: Bool }
struct Inner2 { z: Int?; w: Bool }

struct ComplexNested {
    one: Inner1;
    two: Inner2;
    n: Int;
}

contract ComplexNestedFields {
    s: ComplexNested;
    init() {
        self.s = ComplexNested {
            one: Inner1 { x: 5, y: true },
            two: Inner2 { z: null, w: false },
            n: 42
        };
    }
}