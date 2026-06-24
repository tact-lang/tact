struct Deep {
    level: Int;
    inner: InnerOptional;
}

struct InnerOptional {
    flag: Bool?;
    note: String;
}

contract DeepNestedStruct {
    storage: Deep;

    init() {
        self.storage = Deep{
            level: 1,
            inner: InnerOptional{
                flag: true,
                note: "hello",
            },
        };
    }
}