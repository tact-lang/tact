struct DeepNestA {
    next: DeepNestB;
}
struct DeepNestB {
    next: DeepNestC;
}
struct DeepNestC {
    next: DeepNestD;
}
struct DeepNestD {
    value: Int;
}

contract PersistDeepChain {
    chain: DeepNestA;
    
    init() {
        self.chain = DeepNestA{
            next: DeepNestB{
                next: DeepNestC{
                    next: DeepNestD{
                        value: 777
                    }
                }
            }
        };
    }
}