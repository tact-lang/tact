struct OptionalNested {
    inner: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    flag: Bool;
    text: String;
}

contract OptionalNestedStorage {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            inner: null,
            sub: null
        };
    }
}