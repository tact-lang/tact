struct S1 { f: Int; }
struct S2 { g: S1; }
struct S3 { h: S2; }
struct S4 { i: S3; }
struct S5 { j: S4; }

contract DeepChain {
    val: S5;

    init() {
        self.val = S5{ j: S4{ i: S3{ h: S2{ g: S1{ f: 42 } } } } };
    }
}
