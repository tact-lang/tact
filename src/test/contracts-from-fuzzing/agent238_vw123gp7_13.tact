struct S1 { x: Int; }
struct S2 { s1: S1; y: Int; }

struct S3 {
    a: S2;
    b: S2;
    c: S2;
}

contract ManyNestedStructs {
    field: S3;

    init() {
        self.field = S3{
            a: S2{s1:S1{x:1}, y:2},
            b: S2{s1:S1{x:3}, y:4},
            c: S2{s1:S1{x:5}, y:6}
        };
    }
}