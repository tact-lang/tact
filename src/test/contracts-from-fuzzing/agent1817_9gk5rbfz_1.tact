struct NestedInner {
    deepVal1: Int;
    deepVal2: Int?;
}

struct NestedOuter {
    nest1: NestedInner;
    optionalNest2: NestedInner?;
    someFlag: Bool;
}

contract DeepNestedTest {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            nest1: NestedInner{
                deepVal1: 1,
                deepVal2: null,
            },
            optionalNest2: null,
            someFlag: true,
        };
    }
}
