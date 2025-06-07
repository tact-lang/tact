struct NestingA {
    f: Int;
}

struct NestingB {
    a: NestingA;
}

struct NestingC {
    b: NestingB;
}

contract DeepNestTest {
    c: NestingC;

    init() {
        self.c = NestingC{b:NestingB{a:NestingA{f:123}}};
    }
}