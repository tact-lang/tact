struct DeepNested {
    inner1: InnerNested;
    inner2: InnerNested;
}

struct InnerNested {
    field1: Int;
    field2: Bool?;
}

contract DeepContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner1: InnerNested{ field1: 10, field2: false },
            inner2: InnerNested{ field1: 20, field2: true },
        };
    }
}