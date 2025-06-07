struct Chain5 { a:Int; }
struct Chain4 { n: Chain5; }
struct Chain3 { n: Chain4; }
struct Chain2 { n: Chain3; }
struct Chain1 { n: Chain2; }

contract ChainTest {
    s: Chain1;

    init() {
        self.s = Chain1{
            n: Chain2{
                n: Chain3{
                    n: Chain4{
                        n: Chain5{a:1}
                    }
                }
            }
        };
    }
}