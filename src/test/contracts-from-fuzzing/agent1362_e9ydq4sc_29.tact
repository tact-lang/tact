struct L6 { v: Int; }
struct L5 { f: L6; }
struct L4 { f: L5; }
struct L3 { f: L4; }
struct L2 { f: L3; }
struct L1 { f: L2; }

contract Test {
    deeply: L1;

    init() {
        self.deeply = L1{
            f: L2{
                f: L3{
                    f: L4{
                        f: L5{
                            f: L6{ v: 99 }
                        }
                    }
                }
            }
        };
    }
    receive() {}
}