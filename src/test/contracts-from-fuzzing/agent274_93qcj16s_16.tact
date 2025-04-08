struct MultiLevelOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    nestedStr: String?;
    val: Int;
}

contract NestedOptionalsTest {
    field: MultiLevelOptional;

    init() {
        self.field = MultiLevelOptional{
            inner: InnerStruct{
                nestedStr: null,
                val: 123
            }
        };
    }
}