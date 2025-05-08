struct Deep1 { x: Int; }
struct Deep2 { f: Deep1; }
struct Deep3 { f: Deep2; }
struct Deep4 { f: Deep3; }
struct Deep5 { f: Deep4; }

contract TestContract {
    deepField: Deep5;

    init() {
        self.deepField = Deep5{
            f: Deep4{
                f: Deep3{
                    f: Deep2{
                        f: Deep1{ x: 123 }
                    }
                }
            }
        };
    }
}