struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    opt: NestedOpt?;
}

struct NestedOpt {
    x: Int;
    y: Bool;
}

contract TestContract {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            inner: InnerStruct{
                val: 42,
                opt: NestedOpt{
                    x: 1,
                    y: true,
                },
            }
        };
    }
}