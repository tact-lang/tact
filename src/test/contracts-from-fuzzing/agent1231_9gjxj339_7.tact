struct S1 { a: Int; }
struct S2 { a: Int; b: Bool; }
struct S3 { a: Int; b: Bool; c: Cell; }
contract MultipleStructTypes {
    s1: S1;
    s2: S2;
    s3: S3;
    init() {
        self.s1 = S1{ a: 1 };
        self.s2 = S2{ a: 2, b: true };
        self.s3 = S3{ a: 3, b: false, c: emptyCell() };
    }
}