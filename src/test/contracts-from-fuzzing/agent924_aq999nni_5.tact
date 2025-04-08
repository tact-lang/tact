struct NestedStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract TwoNestedStructs {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner1: InnerStruct{val1: 1, val2: true, val3: "one"},
            inner2: InnerStruct{val1: 2, val2: false, val3: "two"},
        };
    }
}