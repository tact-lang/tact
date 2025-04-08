struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct SCombined {
    first: S1;
    second: S2;
}

contract CombinedStructs {
    data: SCombined;

    init() {
        self.data = SCombined{
            first: S1{ a: 100 },
            second: S2{ b: 200 },
        };
    }
}