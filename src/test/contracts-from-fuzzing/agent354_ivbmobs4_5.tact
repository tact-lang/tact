struct StructA {
    val: Int;
}

struct StructB {
    a: StructA;
}

struct StructC {
    b: StructB;
}

struct StructD {
    c: StructC;
}

contract DeepChainTest {
    d: StructD;

    init() {
        self.d = StructD{
            c: StructC{
                b: StructB{
                    a: StructA{
                        val: 777
                    }
                }
            }
        };
    }
}