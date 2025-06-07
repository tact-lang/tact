struct OptionalNested {
    innerOpt: Int?;
    innerStruct: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract OptNestTest {
    val: OptionalNested;
    init() {
        self.val = OptionalNested{
            innerOpt: null,
            innerStruct: InnerStruct{
                x: 10,
                y: true
            }
        };
    }
}
