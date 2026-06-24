// structs with serialization specifiers combined with nested structures
struct NestedS {
    a: Int as uint32;
    b: Bool;
}

struct Packed {
    x: Int as int64;
    s: NestedS;
}

contract SerializeNested {
    data: Packed;
    init() {
        self.data = Packed{ x: 12, s: NestedS { a: 34, b: true } };
    }
}