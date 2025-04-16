struct S1 { val: Int; }
struct S2 { a: S1; }
struct S3 { b: S2; }
struct S4 { c: S3; }
struct S5 { d: S4; }

contract NestedChain {
    nested: S5;

    init() {
        self.nested = S5{
            d: S4{
                c: S3{
                    b: S2{
                        a: S1{ val: 9 }
                    }
                }
            }
        };
    }
}