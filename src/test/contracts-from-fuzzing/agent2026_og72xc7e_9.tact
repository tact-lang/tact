struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    flag: Bool?;
    value: Int?;
    message: String?;
}

contract TestContract {
    opt: DeepOptional;

    init() {
        self.opt = DeepOptional{
            inner: Inner{
                nested: Nested{
                    flag: null,
                    value: null,
                    message: null
                }
            }
        };
    }
}