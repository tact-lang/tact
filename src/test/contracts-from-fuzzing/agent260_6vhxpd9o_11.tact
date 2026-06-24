struct S5 { x: Int; }
struct S4 { s: S5; }
struct S3 { s: S4; }
struct S2 { s: S3; }
struct S1 { s: S2; }

contract DeepChain {
    data: S1;

    init() {
        self.data = S1{ s: S2{ s: S3{ s: S4{ s: S5{ x: 999 } } } } };
    }
}