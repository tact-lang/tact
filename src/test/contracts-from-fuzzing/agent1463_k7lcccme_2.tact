struct DeeplyNested {
    lvl1: Int;
    lvl2: InnerNested;
}

struct InnerNested {
    inner1: Int;
    inner2: Bool?;
    inner3: InnerMost;
}

struct InnerMost {
    field: String;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            lvl1: 1,
            lvl2: InnerNested{
                inner1: 2,
                inner2: false,
                inner3: InnerMost{
                    field: "deep"
                }
            }
        };
    }
}