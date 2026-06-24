struct NestedOptionalStruct {
    innerOpt: Inner?;
}

struct Inner {
    value: Int?;
}

contract NestedOptStructTest {
    storage: NestedOptionalStruct;

    init() {
        self.storage = NestedOptionalStruct{
            innerOpt: Inner{
                value: null
            }
        };
    }
}