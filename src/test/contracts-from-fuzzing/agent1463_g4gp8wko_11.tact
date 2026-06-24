struct Deep1 { val: Int; }
struct Deep2 { f: Deep1; }
struct Deep3 { f: Deep2; }
struct Deep4 { f: Deep3; }
struct Deep5 { f: Deep4; }

contract VeryDeep {
    state: Deep5;

    init() {
        self.state = Deep5{
            f: Deep4{
                f: Deep3{
                    f: Deep2{
                        f: Deep1{
                            val: 5
                        }
                    }
                }
            }
        };
    }
}
