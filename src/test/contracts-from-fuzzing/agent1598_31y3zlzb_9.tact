struct Chain4 { x: Int; }
struct Chain3 { next: Chain4; }
struct Chain2 { next: Chain3; }
struct Chain1 { next: Chain2; }

contract ChainContract {
    field: Chain1;
    init() {
        self.field = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{x:7}
                }
            }
        };
    }
}