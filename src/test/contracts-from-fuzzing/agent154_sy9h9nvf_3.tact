struct DeeplyNested1 {
    foo: Int;
    bar: Bool;
}

struct DeeplyNested2 {
    d1: DeeplyNested1;
    another: Int?;
}

struct DeeplyNested3 {
    d2: DeeplyNested2;
    text: String;
}

struct DeeplyNested4 {
    d3: DeeplyNested3;
    flag: Bool;
}

contract DeepNestingContract {
    deep: DeeplyNested4;

    init() {
        self.deep = DeeplyNested4{
            d3: DeeplyNested3{
                d2: DeeplyNested2{
                    d1: DeeplyNested1{
                        foo: 7,
                        bar: true,
                    },
                    another: null,
                },
                text: "Deep",
            },
            flag: false,
        };
    }
}