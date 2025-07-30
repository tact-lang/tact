struct Deep1 { f: Int; }
struct Deep2 { g: Deep1; }
struct Deep3 { h: Deep2; }
struct Deep4 { i: Deep3; }
struct Deep5 { j: Deep4; }

contract TestContract {
    dep: Deep5;

    init() {
        self.dep = Deep5{
            j: Deep4{
                i: Deep3{
                    h: Deep2{
                        g: Deep1{
                            f: 123
                        }
                    }
                }
            }
        };
    }
}