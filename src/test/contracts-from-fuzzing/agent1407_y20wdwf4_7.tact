struct InnerMost {
    q: Int?;
}

struct Mid {
    midVal: Int;
    nested: InnerMost;
}

struct Outer {
    outVal: Bool;
    midStruct: Mid;
}

contract TestContract {
    bigNested: Outer;

    init() {
        self.bigNested = Outer{
            outVal: true,
            midStruct: Mid{
                midVal: 1,
                nested: InnerMost{ q: null }
            }
        };
    }
}