struct S1 { f1: Int = 1; }
struct S2 { f2: S1 = S1{}; }
struct S3 { f3: S2 = S2{}; }
struct S4 { f4: S3 = S3{}; }

contract DeepChain {
    data: S4 = S4{};

    init() {
        self.data = S4{ f4: S3{ f3: S2{ f2: S1{ f1: 42 } } } };
    }
}