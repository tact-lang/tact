struct Chain1 { a: Int; }
struct Chain2 { c: Chain1; }
struct Chain3 { d: Chain2; }
struct Chain4 { e: Chain3; }

contract ChainTest {
    x: Chain4;

    init() {
        self.x = Chain4{
            e: Chain3{
                d: Chain2{
                    c: Chain1{ a: 7 }
                }
            }
        };
    }
}