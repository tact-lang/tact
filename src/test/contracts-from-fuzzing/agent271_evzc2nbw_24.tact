struct DeepChainA {
    b: DeepChainB;
}

struct DeepChainB {
    c: DeepChainC;
}

struct DeepChainC {
    d: DeepChainD;
}

struct DeepChainD {
    val: Int;
}

contract DeepChainContract {
    data: DeepChainA;

    init() {
        self.data = DeepChainA{
            b: DeepChainB{
                c: DeepChainC{
                    d: DeepChainD{ val: 999 }
                }
            }
        };
    }
}
