struct InnerMost {
    val: Int;
}

struct NestedOptStruct {
    inner: InnerMost?;
}

contract OptionalStructField {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{
            inner: null
        };
    }
}