struct S1 { val1: Int; }
struct S2 { val2: S1; }
struct S3 { val3: S2; }
struct S4 { val4: S3; }

contract DeepChain {
    data: S4;
    init() {
        self.data = S4{ val4: S3{ val3: S2{ val2: S1{ val1: 42 } } } };
    }
}
