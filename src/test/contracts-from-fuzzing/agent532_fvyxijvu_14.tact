struct Deep1 { a: Int }
struct Deep2 { b: Deep1 }
struct Deep3 { c: Deep2 }
struct Deep4 { d: Deep3 }

contract DeepFourNesting {
    f: Deep4;

    init() {
        self.f = Deep4{
            d: Deep3{
                c: Deep2{
                    b: Deep1{ a: 123 }
                }
            }
        };
    }
}