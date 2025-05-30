struct S1 { f1: Int; }
struct S2 { f2: S1; }
struct S3 { f3: S2; }
struct S4 { f4: S3; }

contract VeryDeepStructure {
    root: S4;

    init() {
        self.root = S4 {
            f4: S3 {
                f3: S2 {
                    f2: S1 { f1: 123 }
                }
            }
        };
    }
}