struct S1 { a: Int; }
struct S2 { b: Int; nested: S1; }
struct S3 { c: Int; nested: S2; }
struct S4 { d: Int; nested: S3; }
struct S5 { e: Int; nested: S4; }

contract DeepChain {
    val: S5;

    init() {
        self.val = S5{
            e: 5,
            nested: S4{
                d: 4,
                nested: S3{
                    c: 3,
                    nested: S2{
                        b: 2,
                        nested: S1{ a: 1 }
                    }
                }
            }
        };
    }
}