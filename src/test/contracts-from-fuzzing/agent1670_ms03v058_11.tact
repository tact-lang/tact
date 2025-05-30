struct Chain1 { a: Int; }
struct Chain2 { a: Chain1; b: Int; }
struct Chain3 { a: Chain2; b: Int; }
struct Chain4 { a: Chain3; b: Int; }

contract TestChainDeep4 {
    d: Chain4;
    init() {
        self.d = Chain4{
            a: Chain3{
                a: Chain2{
                    a: Chain1{a: 1},
                    b: 2
                },
                b: 3
            },
            b: 4
        };
    }
}
