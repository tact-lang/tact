// Nested contract fields type: optional struct with optional of struct
struct S2 {
    z: Int;
}

struct S1 {
    y: S2?;
}

contract NestedOptionalStructs {
    x: S1?;

    init() {
        self.x = null;
    }
}