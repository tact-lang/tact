struct Chain1 {next: Int}
struct Chain2 {next: Chain1}
struct Chain3 {next: Chain2}
struct Chain4 {next: Chain3}
struct Chain5 {next: Chain4}

contract ChainTest {
    chain: Chain5;
    init() {
        self.chain = Chain5{
            next: Chain4{
                next: Chain3{
                    next: Chain2{
                        next: Chain1{next:123}
                    }
                }
            }
        };
    }
}