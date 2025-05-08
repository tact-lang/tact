struct NestA {
    nestB: NestB;
}

struct NestB {
    nestC: NestC;
}

struct NestC {
    nestD: NestD;
}

struct NestD {
    nestE: NestE;
}

struct NestE {
    value: String;
}

contract TestContract {
    nested: NestA;
    init() {
        self.nested = NestA{
            nestB: NestB{
                nestC: NestC{
                    nestD: NestD{
                        nestE: NestE{
                            value: "deep"
                        }
                    }
                }
            }
        };
    }
}