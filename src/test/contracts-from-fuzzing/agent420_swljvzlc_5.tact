struct NestA {
    x: Int;
}

struct NestB {
    y: Int;
    na: NestA;
}

struct NestC {
    z: Int;
    nb: NestB;
}

contract DeepFieldOrdering {
    a: Int;
    b: NestC;
    c: Bool;

    init() {
        self.a = 1;
        self.b = NestC{
            z: 2,
            nb: NestB{
                y: 3,
                na: NestA{
                    x: 4,
                },
            },
        };
        self.c = true;
    }
}