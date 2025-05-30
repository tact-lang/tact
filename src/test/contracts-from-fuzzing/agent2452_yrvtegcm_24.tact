struct StructA { x: Int; }
struct StructB { y: Int; structA: StructA; }
struct StructC { z: Int; structB: StructB; }

contract DeepChain {
    chain: StructC;
    init() {
        self.chain = StructC{
            z: 1,
            structB: StructB{
                y: 2,
                structA: StructA{
                    x: 3
                }
            }
        };
    }
}