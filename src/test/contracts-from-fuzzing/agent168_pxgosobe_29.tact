struct NestA {
    x: Int;
}

struct NestB {
    a: NestA;
}

struct NestC {
    b: NestB;
}

contract TestDeeperStructs {
    val: NestC;

    init() {
        self.val = NestC{ b: NestB{ a: NestA{ x: 1 } } };
    }
}
