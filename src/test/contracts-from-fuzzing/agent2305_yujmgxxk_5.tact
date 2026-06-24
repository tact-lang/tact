struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract TestDeepOptional {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            inner: null
        };
    }
}
