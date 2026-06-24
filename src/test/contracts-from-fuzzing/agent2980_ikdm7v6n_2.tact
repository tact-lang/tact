struct DeeplyNested {
    nested1: Nested1;
}

struct Nested1 {
    nested2: Nested2;
    value1: Int;
}

struct Nested2 {
    nested3: Nested3;
    value2: Bool;
}

struct Nested3 {
    num: Int as uint16;
    opt: String?;
}

contract Test {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            nested1: Nested1{
                nested2: Nested2{
                    nested3: Nested3{
                        num: 123,
                        opt: null,
                    },
                    value2: true,
                },
                value1: 42,
            }
        };
    }
}