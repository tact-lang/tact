struct W {
    a: Int;
}

struct X {
    w: W;
    f: String?;
}

struct Y {
    x: X;
    opt: Bool?;
}

struct Z {
    y: Y;
}

contract StructChain {
    nested: Z;
    init() {
        self.nested = Z{
            y: Y{
                x: X{
                    w: W{
                        a: 42
                    },
                    f: null
                },
                opt: null
            }
        };
    }
}