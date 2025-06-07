struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract DeepOptionTest {
    param: DeepOptional;

    init() {
        self.param = DeepOptional{
            inner: null,
        };
    }
}