struct Deep1 { s: Deep2; }
struct Deep2 { s: Deep3; }
struct Deep3 { s: Deep4; }
struct Deep4 { x: Int; }

contract NestedDepth4 {
    val: Deep1;

    init() {
        self.val = Deep1{
            s: Deep2{
                s: Deep3{
                    s: Deep4{ x: 404 }
                }
            }
        };
    }
}