struct StructA {
    val: Int;
}

struct StructB {
    sa: StructA;
}

struct StructC {
    sb: StructB;
}

struct StructD {
    sc: StructC;
}

struct StructE {
    sd: StructD;
}

contract DeepChain {
    data: StructE;
    init() {
        self.data = StructE{
            sd: StructD{
                sc: StructC{
                    sb: StructB{
                        sa: StructA{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}