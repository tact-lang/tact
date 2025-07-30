struct Chain1 { a: Int }
struct Chain2 { prev: Chain1 }
struct Chain3 { prev: Chain2 }
struct Chain4 { prev: Chain3 }
struct Chain5 { prev: Chain4 }

contract ChainStorage {
    chain: Chain5;

    init() {
        self.chain = Chain5{
            prev: Chain4{
                prev: Chain3{
                    prev: Chain2{
                        prev: Chain1{
                            a: 1
                        }
                    }
                }
            }
        };
    }
}