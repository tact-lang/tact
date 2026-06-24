struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    flag: Bool?;
    count: Int?;
    label: String?;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            inner: Inner{
                nested: Nested{
                    flag: null,
                    count: null,
                    label: null
                }
            }
        };
    }
}