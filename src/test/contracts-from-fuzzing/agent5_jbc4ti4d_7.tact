struct InnerOptional {
    name: String?;
    age: Int?;
}

struct OuterOptional {
    inner: InnerOptional?;
    description: String?;
}

contract OptionalNestedStruct {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null,
            description: null,
        };
    }
}