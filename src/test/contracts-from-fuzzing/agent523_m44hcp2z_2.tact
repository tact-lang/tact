struct InnerNested { x: Int; y: Bool; z: String? }

struct OuterNested {
    n1: InnerNested;
    n2: InnerNested?;
    s: String;
}

contract DeepNest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            n1: InnerNested{x: 1, y: false, z: null},
            n2: null,
            s: "deep"
        };
    }
}
