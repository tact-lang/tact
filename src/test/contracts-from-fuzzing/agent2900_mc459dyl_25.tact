struct L4 { d: Int; }
struct L3 { c: Int; l4: L4; }
struct L2 { b: Int; l3: L3; }
struct L1 { a: Int; l2: L2; }

contract DeepChain {
    root: L1;

    init() {
        self.root = L1{
            a:1,
            l2: L2{
                b:2,
                l3: L3{
                    c:3,
                    l4: L4{ d:4 },
                },
            },
        };
    }
}
