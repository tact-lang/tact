struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: Address; }

struct AllStructs {
    f1: S1;
    f2: S2;
    f3: S3;
}

contract TestContract {
    combined: AllStructs;

    init() {
        self.combined = AllStructs{
            f1: S1{ x: 1 },
            f2: S2{ y: true },
            f3: S3{ z: myAddress() },
        };
    }
}