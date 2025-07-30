struct DeepNested {
    inner: InnerOptional;
}

struct InnerOptional {
    description: String?;
    flag: Bool;
}

contract DeepStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerOptional{
                description: null,
                flag: false,
            },
        };
    }
}
