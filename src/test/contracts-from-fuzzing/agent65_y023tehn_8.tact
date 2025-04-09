struct Chain1 { next: Chain2; val: Int; }
struct Chain2 { next: Chain3; val: Int; }
struct Chain3 { next: Chain4; val: Int; }
struct Chain4 { val: Int; }

contract Test {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            val:1,
            next: Chain2{
                val:2,
                next: Chain3{
                    val:3,
                    next: Chain4{
                        val:4
                    }
                }
            }
        };
    }
}