struct S1 { f1: Int; f2: Bool; }
struct S2 { f3: Int; s: S1; }
struct S3 { f4: Int; s: S2; }
struct S4 { f5: Int; s: S3; }
struct S5 { f6: Int; s: S4; }

contract FiveDeep {
    data: S5;

    init() {
        self.data = S5{
            f6: 6,
            s: S4{
                f5: 5,
                s: S3{
                    f4: 4,
                    s: S2{
                        f3: 3,
                        s: S1{ f1:1, f2:true }
                    }
                }
            }
        };
    }
}
