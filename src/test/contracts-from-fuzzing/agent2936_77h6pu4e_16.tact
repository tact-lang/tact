struct Chain1 { v: Int; }
struct Chain2 { p: Chain1; }
struct Chain3 { p: Chain2; }
struct Chain4 { p: Chain3; }
struct Chain5 { p: Chain4; }
struct Chain6 { p: Chain5; }
struct Chain7 { p: Chain6; }
struct Chain8 { p: Chain7; }

contract Test {
    data: Chain8;

    init() {
        self.data = Chain8{
            p: Chain7{
                p: Chain6{
                    p: Chain5{
                        p: Chain4{
                            p: Chain3{
                                p: Chain2{
                                    p: Chain1{
                                        v: 555
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}