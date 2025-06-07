struct Deep1 { f: Int; }
struct Deep2 { d: Deep1; }
struct Deep3 { c: Deep2; }
struct Deep4 { b: Deep3; }
struct Deep5 { a: Deep4; }

contract DeepNestedStructContract {
    val: Deep5;

    init() {
        self.val = Deep5{
            a: Deep4{
                b: Deep3{
                    c: Deep2{
                        d: Deep1{ f: 42 }
                    }
                }
            }
        };
    }
}