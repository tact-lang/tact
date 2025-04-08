struct NestedLevel2 {
    val1: Int;
    val2: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    optInner: NestedLevel2?;
}

contract DeepNestedFields {
    param: NestedLevel1;

    init() {
        self.param = NestedLevel1{
            inner: NestedLevel2{
                val1: 10,
                val2: true,
            },
            optInner: null
        };
    }
}