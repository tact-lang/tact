struct Chain1 { a: Int; }
struct Chain2 { a: Int; b: Chain1; }
struct Chain3 { a: Int; b: Chain2; }
struct Chain4 { a: Int; b: Chain3; }

contract ChainTest {
    data: Chain4;
    init() {
        self.data = Chain4{
            a:1,
            b: Chain3{
                a:2,
                b: Chain2{
                    a:3,
                    b: Chain1{ a:4 }
                }
            }
        };
    }
}
