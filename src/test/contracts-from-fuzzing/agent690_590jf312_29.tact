struct Chain1 { next: Chain2; }
struct Chain2 { next: Chain3; }
struct Chain3 { next: Chain4; }
struct Chain4 { content: Int; }
contract Chained {
    ref: Chain1;

    init() {
        self.ref = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        content:100
                    }
                }
            }
        };
    }
}