struct L7 { g: Int; }
struct L6 { f: L7; }
struct L5 { e: L6; }
struct L4 { d: L5; }
struct L3 { c: L4; }
struct L2 { b: L3; }
struct L1 { a: L2; }

contract Deep7 {
    data: L1;

    init() {
        self.data = L1{
            a: L2{
                b: L3{
                    c: L4{
                        d: L5{
                            e: L6{
                                f: L7{
                                    g: 1001
                                }
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {}
}