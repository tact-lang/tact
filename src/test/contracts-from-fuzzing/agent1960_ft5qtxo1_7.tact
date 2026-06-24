struct Deep1 { x: Int; }
struct Deep2 { x: Deep1; }
struct Deep3 { x: Deep2; }
struct Deep4 { x: Deep3; }
struct Deep5 { x: Deep4; }

contract FiveDeep {
    val: Deep5;

    init() {
        self.val = Deep5{
            x: Deep4{
                x: Deep3{
                    x: Deep2{
                        x: Deep1{ x: 999 },
                    },
                },
            },
        };
    }
}