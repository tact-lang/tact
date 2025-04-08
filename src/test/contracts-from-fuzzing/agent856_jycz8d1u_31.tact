struct S0 { a: Int }
struct S1 { s0: S0 }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }

contract Chain5Layer {
    value: S4;

    init() {
        self.value = S4{ s3: S3{ s2: S2{ s1: S1{ s0: S0{ a: 512 }}}}};
    }
}