struct S1 { v1: Int; }
struct S2 { v2: S1; }
struct S3 { v3: S2; }
struct S4 { v4: S3; }
struct S5 { v5: S4; }

contract DeepFive {
    data: S5;

    init() {
        self.data = S5{ v5: S4{ v4: S3{ v3: S2{ v2: S1{ v1: 123 } } } } };
    }
}