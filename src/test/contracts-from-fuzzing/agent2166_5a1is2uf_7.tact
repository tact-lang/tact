struct S1 { f1: Int; }
struct S2 { f2: S1; }
struct S3 { f3: S2; }
struct S4 { f4: S3; }
struct S5 { f5: S4; }

contract FiveNestLevels {
    nested: S5;

    init() {
        self.nested = S5{
            f5: S4{
                f4: S3{
                    f3: S2{
                        f2: S1{
                            f1: 123
                        }
                    }
                }
            }
        };
    }
}
