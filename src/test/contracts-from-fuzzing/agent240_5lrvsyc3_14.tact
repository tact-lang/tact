struct S1 { f: Int; }
struct S2 { s: S1; }
struct S3 { s: S2; }
struct S4 { s: S3; }
struct S5 { s: S4; }
contract DeepChainContract {
    data: S5;
    init() {
        self.data = S5{ s: S4{ s: S3{ s: S2{ s: S1{ f: 99 } } } } };
    }
}