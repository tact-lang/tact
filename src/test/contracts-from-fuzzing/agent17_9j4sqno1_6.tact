// Deeply nested structs, but no recursion
struct S1 { a: Int; s2: S2; }
struct S2 { b: Int; s3: S3; }
struct S3 { c: Int; s4: S4; }
struct S4 { d: Int; }

contract TestDeepChain {
    s: S1;

    init() {
        self.s = S1{
            a: 1,
            s2: S2{
                b: 2,
                s3: S3{
                    c: 3,
                    s4: S4{ d: 4 }
                }
            }
        };
    }
}