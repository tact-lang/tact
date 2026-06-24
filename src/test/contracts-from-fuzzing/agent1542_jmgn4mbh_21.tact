struct L4 { q: Int; }
struct L3 { l4: L4; r: String; }
struct L2 { l3: L3; s: Bool; }
struct L1 { l2: L2; t: Int; }

contract Test {
    deep: L1;

    init() {
        self.deep = L1{
            l2: L2{
                l3: L3{
                    l4: L4{ q: 9 },
                    r: "x"
                },
                s: true
            },
            t: 1
        };
    }
}