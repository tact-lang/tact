// contract with deeply nested struct chains
struct S4 { d: Int }
struct S3 { c: S4 }
struct S2 { b: S3 }
struct S1 { a: S2 }

contract DeepNest {
    root: S1;

    init() {
        self.root = S1{
            a: S2{
                b: S3{
                    c: S4{ d: 99 },
                },
            },
        };
    }
}