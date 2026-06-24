struct S1 { f: Int; opt: Int?; }
struct S2 { nested: S1; }
struct S3 { nested: S2; }
struct S4 { nested: S3; }
struct S5 { nested: S4; }

contract DeepOptWrap {
    s: S5;
    init() {
        self.s = S5{
            nested: S4{
                nested: S3{
                    nested: S2{
                        nested: S1{ f: 42, opt: null }
                    }
                }
            }
        };
    }
}