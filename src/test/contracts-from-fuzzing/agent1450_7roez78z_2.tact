struct DeeplyNested1 {
    nested2: DeeplyNested2;
}

struct DeeplyNested2 {
    nested3: DeeplyNested3;
}

struct DeeplyNested3 {
    nested4: DeeplyNested4;
}

struct DeeplyNested4 {
    leaf: Int;
}

contract DeepNestTest {
    storage: DeeplyNested1;

    init() {
        self.storage = DeeplyNested1{
            nested2: DeeplyNested2{
                nested3: DeeplyNested3{
                    nested4: DeeplyNested4{
                        leaf: 123,
                    },
                },
            },
        };
    }
}