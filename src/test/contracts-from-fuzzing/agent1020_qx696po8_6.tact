struct OptionNested {
    optInner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract OptionalNestedTest {
    data: OptionNested;

    init() {
        self.data = OptionNested{
            optInner: null
        };
    }
}