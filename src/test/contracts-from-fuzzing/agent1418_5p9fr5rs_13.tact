struct NestA {
    aa: Int;
    ab: Int?;
}

struct NestB {
    ba: String;
    bb: NestA;
}

contract NestedStructOptionalFields {
    f: NestB;

    init() {
        self.f = NestB{
            ba: "hi",
            bb: NestA{
                aa: 8,
                ab: null,
            }
        };
    }
}