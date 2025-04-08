struct Tiny {
    a: Int;
}

struct NestedTiny {
    inner1: Tiny;
    inner2: Tiny;
    inner3: Tiny;
}

contract NestedTinyStructs {
    s: NestedTiny;

    init() {
        self.s = NestedTiny{
            inner1: Tiny{ a:1 },
            inner2: Tiny{ a:2 },
            inner3: Tiny{ a:3 }
        };
    }
}