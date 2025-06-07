struct Chain1 { x: Int; } 
struct Chain2 { prev: Chain1; } 
struct Chain3 { prev: Chain2; } 
struct Chain4 { prev: Chain3; } 
struct Chain5 { prev: Chain4; }

contract DeepChain {
    chain: Chain5;
    init() {
        self.chain = Chain5{
            prev: Chain4{
                prev: Chain3{
                    prev: Chain2{
                        prev: Chain1{ x:55 }
                    }
                }
            }
        };
    }
}