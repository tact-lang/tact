struct ManyNestedOptionals {
    level1: Int?;
    level2: Bool?;
    nestedStruct: OptionalInner?;
}

struct OptionalInner {
    valA: Int?;
    valB: Bool?;
}

contract DeepOptionalTest {
    nestedOpt: ManyNestedOptionals;

    init() {
        self.nestedOpt = ManyNestedOptionals{
            level1: null,
            level2: false,
            nestedStruct: OptionalInner{
                valA: 123,
                valB: null
            }
        };
    }
}