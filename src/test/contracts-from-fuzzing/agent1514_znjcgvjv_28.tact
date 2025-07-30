struct Chain1 { a: Int }
struct Chain2 { b: Chain1 }
struct Chain3 { c: Chain2 }
struct Chain4 { d: Chain3 }
struct Chain5 { e: Chain4 }
struct Chain6 { f: Chain5 }
struct Chain7 { g: Chain6 }
struct Chain8 { h: Chain7 }

contract EightNesting {
    root: Chain8;

    init() {
        self.root = Chain8{
            h: Chain7{
                g: Chain6{
                    f: Chain5{
                        e: Chain4{
                            d: Chain3{
                                c: Chain2{
                                    b: Chain1{
                                        a: 4
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