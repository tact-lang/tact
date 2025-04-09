struct L5 { e: Int; }
struct L4 { d: L5; }
struct L3 { c: L4; }
struct L2 { b: L3; }
struct L1 { a: L2; }

contract Deep5 {
    data: L1;

    init() {
        self.data = L1{
            a: L2{
                b: L3{
                    c: L4{
                        d: L5{
                            e: 4242
                        }
                    }
                }
            }
        };
    }

    receive() {}
}