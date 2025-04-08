struct NestedStruct {
    val1: Int;
    optInner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    message: String;
}

contract DeepOptionalTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            val1: 42,
            optInner: null,
        };
    }
}