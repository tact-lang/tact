struct OptionalNested {
    num: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    text: String;
    flag: Bool?;
}

contract OptNestedFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            num: null,
            inner: null,
        };
    }
}
