struct DeepLevel3 {
    value: String;
}

struct DeepLevel2 {
    inner: DeepLevel3;
}

struct DeepLevel1 {
    inner: DeepLevel2;
}

contract DeepNestedContract {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            inner: DeepLevel2{
                inner: DeepLevel3{
                    value: "deep nesting",
                },
            },
        };
    }
}