struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    deep: DeepStruct?;
}

struct DeepStruct {
    val: Int;
}

contract Test {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            inner: InnerStruct{
                deep: null
            }
        };
    }
}