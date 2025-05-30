struct DeeplyNested {
    nested1: Int;
    nested2: Int;
}

struct NestedSecond {
    deep: DeeplyNested;
    other: Int;
}

struct TopLevel {
    first: NestedSecond;
    second: NestedSecond;
}

contract MultipleNesting {
    complex: TopLevel;

    init() {
        self.complex = TopLevel{
            first: NestedSecond{
                deep: DeeplyNested{
                    nested1: 1,
                    nested2: 2
                },
                other: 3
            },
            second: NestedSecond{
                deep: DeeplyNested{
                    nested1: 4,
                    nested2: 5
                },
                other: 6
            }
        };
    }
}