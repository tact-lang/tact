struct NestA {
    b: NestB;
}

struct NestB {
    c: NestC;
}

struct NestC {
    d: Int;
}

contract Test {
    nest: NestA;

    init() {
        self.nest = NestA{ b: NestB{ c: NestC{ d: 123 } } };
    }
}
// Nesting depth of 3 inside persistent storage