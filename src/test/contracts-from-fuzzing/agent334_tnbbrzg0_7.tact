struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
}
contract Test {
    complex: Combo;

    init() {
        self.complex = Combo{
            s1: S1{ a: 42 },
            s2: S2{ b: false },
            s3: S3{ c: "hi" }
        };
    }
}