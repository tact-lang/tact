struct InnerA { a: Int }
struct InnerB { b: String }
struct InnerC { c: Bool }

struct Combined {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

contract NestedStructs {
    field: Combined;

    init() {
        self.field = Combined{
            a: InnerA{a: 1},
            b: InnerB{b: "test"},
            c: InnerC{c: true},
        };
    }
}