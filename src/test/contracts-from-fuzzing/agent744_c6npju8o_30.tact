struct NestedOptionalStruct {
    inner: Sub?;
}

struct Sub {
    field: Int;
}

contract NestedOptionalsStruct {
    val: NestedOptionalStruct;

    init() {
        self.val = NestedOptionalStruct{
            inner: null,
        };
    }
}