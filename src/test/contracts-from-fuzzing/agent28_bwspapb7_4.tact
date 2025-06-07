struct S1 { f1: Int; }
struct S2 { f2: Bool; }
struct S3 { f3: String; }
struct S4 { f4: Int?; }

contract TestContract {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;

    init() {
        self.s1 = S1{ f1: 1 };
        self.s2 = S2{ f2: false };
        self.s3 = S3{ f3: "abc" };
        self.s4 = S4{ f4: null };
    }
}