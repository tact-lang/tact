struct S1 { a: Int; }
struct S2 { s1: S1; int2: Int; }
struct S3 { s2: S2; s1b: S1; }

contract ComplexNested {
    val: S3;

    init() {
        self.val = S3{ s2: S2{ s1: S1{a:3}, int2:5 }, s1b: S1{a:7} };
    }
}