struct Deep1 { v: Int; }
struct Deep2 { d1: Deep1; }
struct Deep3 { d2: Deep2; }
struct Deep4 { d3: Deep3; }
struct Deep5 { d4: Deep4; }

contract DeepNestTest {
    val: Deep5;

    init() {
        self.val = Deep5{
            d4: Deep4{
                d3: Deep3{
                    d2: Deep2{
                        d1: Deep1{
                            v: 777
                        }
                    }
                }
            }
        };
    }
}