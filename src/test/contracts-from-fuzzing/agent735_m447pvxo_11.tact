struct Chain5 {
    a: Int;
    b: Chain4;
}
struct Chain4 {
    a: Int;
    b: Chain3;
}
struct Chain3 {
    a: Int;
    b: Chain2;
}
struct Chain2 {
    a: Int;
    b: Chain1;
}
struct Chain1 {
    a: Int;
}

contract NestedChain {
    val: Chain5;
    init() {
        self.val = Chain5{
            a:1,
            b: Chain4{
                a:2,
                b: Chain3{
                    a:3,
                    b: Chain2{
                        a:4,
                        b: Chain1{a:5}
                    }
                }
            }
        };
    }
}