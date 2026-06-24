struct InnerNested {
    a: Int;
    b: Bool?;
}

struct OuterNested {
    x: Int;
    y: InnerNested;
    z: Int?;
}

contract TestStorage {
    data: OuterNested;
    init() {
        self.data = OuterNested{
            x: 1,
            y: InnerNested{a: 2, b: true},
            z: 3
        };
    }
}