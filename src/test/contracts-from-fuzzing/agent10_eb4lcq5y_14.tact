struct S0 { v0: Int; }
struct S1 { v1: S0; }
struct S2 { v2: S1; }
struct S3 { v3: S2; }
struct S4 { v4: S3; }
struct S5 { v5: S4; }

contract DeepChain {
    x: S5;
    init() {
        self.x = S5{ v5: S4{ v4: S3{ v3: S2{ v2: S1{ v1: S0{ v0: 7 } } } } } };
    }
    receive() {}
}