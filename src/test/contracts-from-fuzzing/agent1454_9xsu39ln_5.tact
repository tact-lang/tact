struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: Int?; }

contract MultiNested {
    nested1: S1;
    nested2: S2;
    nested3: S3;

    init() {
        self.nested1 = S1{ a: 1 };
        self.nested2 = S2{ b: false };
        self.nested3 = S3{ c: null };
    }
}