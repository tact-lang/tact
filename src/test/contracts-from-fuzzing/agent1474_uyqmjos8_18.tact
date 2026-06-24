struct Chain5 { next: Chain4; }
struct Chain4 { next: Chain3; }
struct Chain3 { next: Chain2; }
struct Chain2 { next: Chain1; }
struct Chain1 { val: Int; }

contract Test17 {
    chain: Chain5;
    init() {
        self.chain = Chain5{
            next: Chain4{
                next: Chain3{
                    next: Chain2{
                        next: Chain1{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}