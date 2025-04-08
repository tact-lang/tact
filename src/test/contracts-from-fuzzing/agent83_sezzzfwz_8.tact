struct S1 { a: Int }
struct S2 { b: Bool; s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }
struct S5 { s4: S4 }

contract DeepNesting {
    x: S5;

    init() {
        self.x = S5{ s4: S4{ s3: S3{ s2: S2{ b: true, s1: S1{a:1} } } } };
    }
}