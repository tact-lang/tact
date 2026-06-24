struct DeepNested {
    num: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract DeepNestedContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            num: 99,
            inner: InnerStruct{
                flag: true,
                text: "hello"
            }
        };
    }
}