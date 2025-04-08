struct NestA {
    a: Int;
}

struct NestB {
    b: NestA;
}

struct NestC {
    c: NestB;
}

contract VeryDeepNest {
    x: NestC;
    init() {
        self.x = NestC{ c: NestB{ b: NestA{ a: 42 } } };
    }
}