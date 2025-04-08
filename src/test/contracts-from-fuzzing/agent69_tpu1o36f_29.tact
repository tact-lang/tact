struct NestedOptionalStruct {
    nested: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptStructTest {
    d: NestedOptionalStruct;

    init() {
        self.d = NestedOptionalStruct{
            nested: InnerOpt{
                x: null,
                y: null
            }
        };
    }
}