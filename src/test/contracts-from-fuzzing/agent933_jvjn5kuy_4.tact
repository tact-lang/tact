struct Deep1 { a: Int; }
struct Deep2 { b: Deep1; }
struct Deep3 { c: Deep2; }
struct Deep4 { d: Deep3; }

contract DeepNest {
    s: Deep4;
    init() {
        self.s = Deep4{
            d: Deep3{
                c: Deep2{
                    b: Deep1{a: 42}
                }
            }
        };
    }
}
