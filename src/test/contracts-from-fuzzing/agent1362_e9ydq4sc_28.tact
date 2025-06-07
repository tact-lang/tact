struct L4 { val: Int; }
struct L3 { f: L4; }
struct L2 { f: L3; }
struct L1 { f: L2; }

contract Test {
    nest: L1;

    init() {
        self.nest = L1{
            f: L2{
                f: L3{
                    f: L4{ val: 42 }
                }
            }
        };
    }
    receive() {}
}