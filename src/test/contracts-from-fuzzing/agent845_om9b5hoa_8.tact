struct InnerStruct {
    val1: Int;
    val2: Bool;
}

struct WrappedStruct {
    innerField: InnerStruct;
}

contract DeepWrap {
    field: WrappedStruct;

    init() {
        self.field = WrappedStruct{
            innerField: InnerStruct{
                val1: 1,
                val2: true
            }
        };
    }
}