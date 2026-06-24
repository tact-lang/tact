struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
}

contract DeepChain {
    data: StructC = StructC{
        c: StructB{
            b: StructA{
                a: 42
            }
        }
    };
    init() {
        self.data = StructC{
            c: StructB{
                b: StructA{
                    a: 43
                }
            }
        };
    }
}
