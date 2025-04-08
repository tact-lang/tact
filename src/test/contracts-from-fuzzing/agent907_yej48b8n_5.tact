struct Deep1 { f: Int; }
struct Deep2 { s: Deep1; }
struct Deep3 { s: Deep2; }
struct Deep4 { s: Deep3; }
struct Deep5 { s: Deep4; }

contract VeryDeepNested {
    deep: Deep5;

    init() {
        self.deep = Deep5{
            s: Deep4{
                s: Deep3{
                    s: Deep2{
                        s: Deep1{f: 42}
                    }
                }
            }
        };
    }
}