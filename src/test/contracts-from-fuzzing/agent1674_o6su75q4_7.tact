struct Metadata {
    version: Int;
    author: String;
}

struct Wrapper {
    value: Int;
    meta: Metadata?;
}

contract OptionalNestedStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            value: 88,
            meta: null,
        };
    }
}