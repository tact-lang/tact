struct DeepNested {
    a: Int;
    b: Bool?;
    c: StructNested;
}

struct StructNested {
    d: Int;
    e: Bool;
}

contract Test {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            a: 1,
            b: null,
            c: StructNested{
                d: 42,
                e: false
            }
        };
    }
}