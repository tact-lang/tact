struct S1 { a: Int; b: Int }
struct S2 { a: S1; b: S1 }
struct S3 { a: S2; b: S2 }

contract WideTree {
    root: S3;

    init() {
        self.root = S3{
            a: S2{ a: S1{a:1,b:2}, b: S1{a:3,b:4} },
            b: S2{ a: S1{a:5,b:6}, b: S1{a:7,b:8} },
        };
    }
}