struct DeepNested {
    inner: Inner;
}

struct Inner {
    detail: Detail;
}

struct Detail {
    description: String;
    flag: Bool;
    number: Int;
}

contract DeepNestedField {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Inner{
                detail: Detail{
                    description: "desc",
                    flag: true,
                    number: 42
                }
            }
        };
    }
}