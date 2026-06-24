struct ComposeOptionalNested {
    inner1: Int?;
    inner2: OptionalInner?;
}

struct OptionalInner {
    field1: Int;
    field2: Bool;
}

contract ComposeOptionalNestedStorage {
    val: ComposeOptionalNested;

    init() {
        self.val = ComposeOptionalNested{
            inner1: null,
            inner2: OptionalInner{field1:7,field2:true},
        };
    }
}