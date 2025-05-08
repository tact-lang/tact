struct Deep1 { x: Int; }
struct Deep2 { a: Deep1; }
struct Deep3 { b: Deep2; }
struct Deep4 { c: Deep3; }
struct Deep5 { d: Deep4; }

contract DeepNest {
    val: Deep5;

    init() {
        self.val = Deep5{
            d: Deep4{
                c: Deep3{
                    b: Deep2{
                        a: Deep1{ x: 9000 }
                    }
                }
            }
        };
    }
}