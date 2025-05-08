struct DeeplyNested3 {
    val3: Int;
}

struct DeeplyNested2 {
    nested3: DeeplyNested3;
    optNested3: DeeplyNested3?;
}

struct DeeplyNested1 {
    nested2: DeeplyNested2;
    optNested2: DeeplyNested2?;
}

contract DeepNestedContract {
    state: DeeplyNested1;

    init() {
        self.state = DeeplyNested1{
            nested2: DeeplyNested2{
                nested3: DeeplyNested3{ val3: 123 },
                optNested3: null
            },
            optNested2: null
        };
    }
}
