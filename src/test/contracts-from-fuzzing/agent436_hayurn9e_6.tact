struct S1 { v: Int; }
struct S2 { v: S1; }
struct S3 { v: S2; }
struct S4 { v: S3; }
struct S5 { v: S4; }

contract TestContract {
    big: S5;
    init() {
        self.big = S5{
            v: S4{
                v: S3{
                    v: S2{
                        v: S1{ v: 42 }
                    }
                }
            }
        };
    }
}
