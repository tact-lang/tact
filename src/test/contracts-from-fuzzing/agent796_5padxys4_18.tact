struct InnerMost { v: Int; }
struct L2 { x: InnerMost; y: InnerMost; }
struct L3 { a: L2; b: L2; }
struct L4 { l: L3; }

contract Test {
    big: L4;
    init() {
        self.big = L4{
            l: L3{
                a: L2{ x: InnerMost{v:1}, y: InnerMost{v:2} },
                b: L2{ x: InnerMost{v:3}, y: InnerMost{v:4} }
            }
        };
    }
}