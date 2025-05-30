struct StrA {
    x: Int;
    y: Int;
}

struct StrB {
    nestedA: StrA;
}

struct StrC {
    nestedB: StrB;
}

contract NullDeepInit {
    f1: StrC;

    init() {
        self.f1 = StrC{
            nestedB: StrB{
                nestedA: StrA{
                    x: 11,
                    y: 22
                }
            }
        };
    }
}