// deeply nested single field repeated struct pattern
struct S5 { val: Int; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepSingleChain {
    data: S1;

    init() {
        self.data = S1{ s2: S2{ s3: S3{ s4: S4{ s5: S5{ val: 555 }} } } };
    }
}