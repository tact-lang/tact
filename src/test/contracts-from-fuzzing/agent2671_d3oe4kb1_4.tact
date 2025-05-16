struct DeeperNested {
    inner: OptionalField;
    str: String;
}

struct OptionalField {
    maybeVal: Int?;
    num: Int;
}

contract DeepNestedContract {
    data: DeeperNested;

    init() {
        self.data = DeeperNested{
            inner: OptionalField{
                maybeVal: 10,
                num: 20
            },
            str: "hello"
        };
    }
}