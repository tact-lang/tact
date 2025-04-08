// Test contract with very deep nested struct composition
struct S5 { val: Int; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepStruct {
    top: S1;
    init() {
        self.top = S1{ s2: S2{ s3: S3{ s4: S4{ s5: S5{ val: 42 } } } } };
    }
}
