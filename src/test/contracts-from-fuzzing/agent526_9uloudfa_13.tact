struct DeeplyNested4 {
    v: Int;
}

struct DeeplyNested3 {
    d4: DeeplyNested4;
}

struct DeeplyNested2 {
    d3: DeeplyNested3;
}

struct DeeplyNested1 {
    d2: DeeplyNested2;
}

contract CrazyDeep {
    root: DeeplyNested1;

    init() {
        self.root = DeeplyNested1{
            d2: DeeplyNested2{
                d3: DeeplyNested3{
                    d4: DeeplyNested4{
                        v: 123,
                    },
                },
            },
        };
    }

    receive() {}
}