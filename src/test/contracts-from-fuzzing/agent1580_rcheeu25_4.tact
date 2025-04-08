struct S1 { s: String; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }
struct S5 { s4: S4; }

contract TestContract {
    field: S5;

    init() {
        self.field = S5{ s4: S4{ s3: S3{ s2: S2{ s1: S1{ s: "deep" } } } } };
    }
}