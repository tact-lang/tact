struct NestedFields {
    flag: Bool;
    count: Int;
    comment: String;
    inner: InnerStruct;
    optionalString: String?;
}

struct InnerStruct {
    value: Int;
    toggle: Bool;
}

contract TestContract {
    data: NestedFields;

    init() {
        self.data = NestedFields{
            flag: true,
            count: 42,
            comment: "hello",
            inner: InnerStruct{
                value: 7,
                toggle: false,
            },
            optionalString: null,
        };
    }
}