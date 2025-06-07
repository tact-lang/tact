struct DeeplyNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    value: Int;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    value: 123,
                },
            },
        };
    }
}