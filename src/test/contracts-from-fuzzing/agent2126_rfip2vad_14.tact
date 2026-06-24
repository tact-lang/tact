struct S1 { v1: Int; }
struct S2 { v2: Int; }
struct S3 { v3: Int; }
struct S4 { v4: Int; }
struct S5 { s1: S1; s2: S2; s3: S3; s4: S4; }

contract TestContract {
    val: S5;

    init() {
        self.val = S5{
            s1: S1{ v1: 1 },
            s2: S2{ v2: 2 },
            s3: S3{ v3: 3 },
            s4: S4{ v4: 4 },
        };
    }
}
