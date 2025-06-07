struct DeepNested {
    field1: Int;
    optStruct: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    maybeVal: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            field1: 10,
            optStruct: null,
        };
    }
}
