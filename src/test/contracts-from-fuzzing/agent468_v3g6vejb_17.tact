// test large ordered chain of struct fields
struct Chain1 { nxt: Chain2; }
struct Chain2 { nxt: Chain3; }
struct Chain3 { nxt: Chain4; }
struct Chain4 { nxt: Chain5; }
struct Chain5 { leaf: Int; }

contract TestContract {
    val: Chain1;

    init() {
        self.val = Chain1{
            nxt: Chain2{
                nxt: Chain3{
                    nxt: Chain4{
                        nxt: Chain5{ leaf: 99 }
                    }
                }
            }
        };
    }
}