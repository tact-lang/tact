struct DeepChainA { a: Int; }
struct DeepChainB { b: DeepChainA; }
struct DeepChainC { c: DeepChainB; }
struct DeepChainD { d: DeepChainC; }
struct DeepChainE { e: DeepChainD; }

contract FiveLayer {
    val: DeepChainE;

    init() {
        self.val = DeepChainE{
            e: DeepChainD{
                d: DeepChainC{
                    c: DeepChainB{
                        b: DeepChainA{ a: 55 }
                    }
                }
            }
        };
    }
}