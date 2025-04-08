struct Chain1 { next: Chain2 }
struct Chain2 { next: Chain3 }
struct Chain3 { next: Chain4 }
struct Chain4 { finalVal: Int }

contract ChainLink {
    chain: Chain1;
    init() {
        self.chain = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        finalVal: 99
                    }
                }
            }
        };
    }
}