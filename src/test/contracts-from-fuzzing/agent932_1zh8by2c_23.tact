// Large nested structure with various optionals and primitives, deeply nested
struct D3 {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct D2 {
    deep: D3?;
    flag: Bool;
}

struct D1 {
    mid: D2?;
    id: Int;
}

contract ComplexNested {
    data: D1;

    init() {
        self.data = D1{
            mid: null,
            id: 5
        };
    }
}
