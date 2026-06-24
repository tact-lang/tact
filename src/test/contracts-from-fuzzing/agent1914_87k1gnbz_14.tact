struct Chain1 { nxt: Chain2; }
struct Chain2 { nxt: Chain3; }
struct Chain3 { nxt: Chain4; }
struct Chain4 { nxt: Chain5; }
struct Chain5 { end: Int; }

contract TestContract {
    lst: Chain1;

    init() {
        self.lst = Chain1{
            nxt: Chain2{
                nxt: Chain3{
                    nxt: Chain4{
                        nxt: Chain5{
                            end: 5
                        }
                    }
                }
            }
        };
    }
}