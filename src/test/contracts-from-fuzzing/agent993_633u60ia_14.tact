struct InnerDeep {
    deep: Int;
}

struct MidLevel {
    midVal: Int;
    deepStruct: InnerDeep;
}

struct TopLevel {
    topVal: Int;
    nestedMid: MidLevel;
}

contract TestContract {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            topVal: 9,
            nestedMid: MidLevel{
                midVal: 99,
                deepStruct: InnerDeep{
                    deep: 999
                }
            }
        };
    }
}