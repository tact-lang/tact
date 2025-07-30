// deeply nested with optional+serialization
struct S2 {
    val: Int? as uint32;
}

struct S1 {
    nested: S2;
}

contract Test23 {
    x: S1;
    init() {
        self.x = S1{
            nested: S2{ val: null }
        };
    }
}