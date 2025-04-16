struct Chain1 {
    nxt: Chain2?;
}
struct Chain2 {
    nxt: Chain3?;
}
struct Chain3 {
    nxt: Chain4?;
}
struct Chain4 {
    nxt: Chain5?;
}
struct Chain5 {
    val: Int;
}

contract LongOptionChain {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            nxt: Chain2{
                nxt: Chain3{
                    nxt: Chain4{
                        nxt: Chain5{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}
