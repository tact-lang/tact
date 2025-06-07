struct S1 { n: Int; }
struct S2 { f: Bool; }
struct S3 { x: String; }

contract NestedFields {
    f1: S1;
    f2: S2;
    f3: S3;

    init() {
        self.f1 = S1{ n: 1 };
        self.f2 = S2{ f: true };
        self.f3 = S3{ x: "hi" };
    }
}