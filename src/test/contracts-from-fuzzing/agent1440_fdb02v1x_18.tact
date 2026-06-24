struct NestedOptionalStruct {
    val1: Int?;
    val2: Int?;
}

struct WrapOptional {
    nested: NestedOptionalStruct?;
    flag: Bool;
}

contract OptInOptTest {
    data: WrapOptional;

    init() {
        self.data = WrapOptional{
            nested: NestedOptionalStruct{ val1: null, val2: 22 },
            flag: true
        };
    }
}