struct S1 { a: Int }
struct S2 { b: Int }

struct S3 {
    x: S1;
    y: S2;
}

contract MultipleStructs {
    s: S3 = S3{x: S1{a:1}, y: S2{b:2}};
}