struct Chain1 { v1: Int }
struct Chain2 { c1: Chain1 }
struct Chain3 { c2: Chain2 }
struct Chain4 { c3: Chain3 }

contract ChainTest {
    data: Chain4;
    init() {
        self.data = Chain4{
            c3: Chain3{
                c2: Chain2{
                    c1: Chain1{
                        v1: 999
                    }
                }
            }
        };
    }
}