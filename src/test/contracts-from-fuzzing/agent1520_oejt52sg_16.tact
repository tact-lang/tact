struct Chain1 { next: Int }
struct Chain2 { next: Chain1 }
struct Chain3 { next: Chain2 }
struct Chain4 { next: Chain3 }

contract ChainTest {
    c: Chain4;
    init() {
        self.c = Chain4{
            next: Chain3{
                next: Chain2{
                    next: Chain1{
                        next: 5
                    }
                }
            }
        };
    }
}