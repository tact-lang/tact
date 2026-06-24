struct L4 { d: Int; }
struct L3 { c: L4?; }
struct L2 { b: L3; }
struct L1 { a: L2; }

contract DeepOptNull {
    data: L1;

    init() {
        self.data = L1{
            a: L2{
                b: L3{
                    c: null
                }
            }
        };
    }

    receive() {}
}