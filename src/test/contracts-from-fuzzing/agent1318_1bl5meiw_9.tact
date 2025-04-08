struct Chain1 { nxt: Chain2; }
struct Chain2 { nxt: Chain3; }
struct Chain3 { nxt: Chain4; }
struct Chain4 { val: Int; }

contract DeepChain {
    value: Chain1;

    init() {
        self.value = Chain1{
            nxt: Chain2{
                nxt: Chain3{
                    nxt: Chain4{ val: 999 }
                }
            }
        };
    }
}