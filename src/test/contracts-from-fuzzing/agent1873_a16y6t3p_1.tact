struct InnerNested {
    small1: Int as uint8;
    flag: Bool;
    big1: Int;
}

struct MiddleNested {
    flag2: Bool;
    inner: InnerNested;
    val2: Int as int16;
}

contract DeepNestedContract {
    field: MiddleNested;
    
    init() {
        self.field = MiddleNested{
            flag2: true,
            inner: InnerNested{
                small1: 123,
                flag: false,
                big1: 1000000000,
            },
            val2: -32000,
        };
    }
}