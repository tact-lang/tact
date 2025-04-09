struct S1 { x: Int }
struct S2 { y: Bool }
struct S3 { z: String }

struct Combined {
    one: S1;
    two: S2;
    three: S3;
}

contract NestedStructs {
    s: Combined;

    init() {
        self.s = Combined{
            one: S1{ x: 10 },
            two: S2{ y: false },
            three: S3{ z: "abc" },
        };
    }
}