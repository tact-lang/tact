struct DeeplyNested1 {
    a: Int;
}

struct DeeplyNested2 {
    b: DeeplyNested1;
}

struct DeeplyNested3 {
    c: DeeplyNested2;
}

struct DeeplyNested4 {
    d: DeeplyNested3;
}

contract DeepNestTest {
    s: DeeplyNested4;

    init() {
        self.s = DeeplyNested4{
            d: DeeplyNested3{
                c: DeeplyNested2{
                    b: DeeplyNested1{
                        a: 42,
                    },
                },
            },
        };
    }
}