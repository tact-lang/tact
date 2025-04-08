struct NestedStruct {
    val1: Int;
    val2: Bool;
    val3: String;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract NestedFields {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            val1: 1,
            val2: true,
            val3: "hi",
            inner: InnerStruct{ flag: false, text: "hello" }
        };
    }
}
