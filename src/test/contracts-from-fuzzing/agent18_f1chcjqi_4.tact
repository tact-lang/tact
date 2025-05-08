struct OptionalNested {
    i: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    text: String;
    flag: Bool?;
}

contract OptNestedContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested {
            i: null,
            inner: null
        };
    }
}