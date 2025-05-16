struct L4 { q: Int?; r: String = ""; }

struct L3 { p: L4; t: Bool = true; }

struct L2 { s: Int; u: L3; }

struct L1 { v: L2; w: Bool?; }

contract TestContract {
    data: L1;

    init() {
        self.data = L1{
            v: L2{
                s: 3,
                u: L3{
                    p: L4{ q: null, r: "done" },
                    t: false
                }
            },
            w: null
        };
    }
}