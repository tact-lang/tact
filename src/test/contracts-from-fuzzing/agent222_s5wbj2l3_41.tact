struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract DeepOptContract {
    field: DeepOptional;

    init() {
        self.field = DeepOptional{
            inner: null
        };
    }
}