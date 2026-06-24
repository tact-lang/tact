struct InnerA {
    valA: Int;
}

struct InnerB {
    valB: Int;
}

struct Combined {
    a: InnerA;
    b: InnerB;
}

contract EmbeddedStructs {
    data: Combined;

    init() {
        self.data = Combined{
            a: InnerA{valA: 11},
            b: InnerB{valB: 22}
        };
    }
}