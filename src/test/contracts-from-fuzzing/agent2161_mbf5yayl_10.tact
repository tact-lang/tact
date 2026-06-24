// Compose nested struct with many optional nested fields all set to null
struct DeepOptionals {
    a: Int?;
    b: Nested?;
}

struct Nested {
    x: Int?;
    y: Inner?;
}

struct Inner {
    z: Int?;
}

contract NullDeepNested {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: null,
            b: null,
        };
    }
}