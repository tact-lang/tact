struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract DeepOptionalField {
    field: DeepOptional;

    init() {
        self.field = DeepOptional{
            inner: Inner{
                x: 10,
                y: 20
            }
        };
    }
}