struct S1 {
    a: Int;
}
struct S2 {
    b: S1;
}
struct S3 {
    c: S2;
}

contract Chain {
    x: S3;

    init() {
        self.x = S3{ c: S2{ b: S1{ a: 33 } } };
    }
}