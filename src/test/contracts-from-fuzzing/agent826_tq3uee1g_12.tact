struct S1 { a: Int }
struct S2 { a: Int }
struct S3 { a: Int }
struct S4 { a: Int }
struct S5 { a: Int }

struct Nested {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}

contract NestedGroupTest {
    container: Nested;
    init() {
        self.container = Nested{
            s1: S1{a:1},
            s2: S2{a:2},
            s3: S3{a:3},
            s4: S4{a:4},
            s5: S5{a:5}
        };
    }
}