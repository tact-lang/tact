struct StructA {
    ai: Int;
    ab: Bool;
}

struct StructB {
    bi: Int;
    bb: Bool;
    nested: StructA;
}

struct StructC {
    ci: Int;
    cb: Bool;
    nested: StructB;
}

contract DeepStructChain {
    val: StructC = StructC{
        ci: 1,
        cb: true,
        nested: StructB{
            bi: 2,
            bb: false,
            nested: StructA{
                ai: 3,
                ab: true
            }
        }
    };

    init() {
        self.val = StructC{
            ci: 10,
            cb: false,
            nested: StructB{
                bi: 20,
                bb: true,
                nested: StructA{
                    ai: 30,
                    ab: false
                }
            }
        };
    }
}