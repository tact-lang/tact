struct Data1 { v1: Int; }
struct Data2 { v2: Int; }

struct BigUnion {
    a: Data1?;
    b: Data2?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalFieldsUnionStorage {
    field: BigUnion;

    init() {
        self.field = BigUnion{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}