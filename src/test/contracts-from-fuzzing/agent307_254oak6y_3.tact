struct Deep1 { a: Int; }
struct Deep2 { sub: Deep1; }
struct Deep3 { sub: Deep2; }
struct Deep4 { sub: Deep3; }
struct Deep5 { sub: Deep4; }

contract TestContract {
    field: Deep5;
    init() {
        self.field = Deep5{
            sub: Deep4{
                sub: Deep3{
                    sub: Deep2{
                        sub: Deep1{ a: 42 }
                    }
                }
            }
        };
    }
}