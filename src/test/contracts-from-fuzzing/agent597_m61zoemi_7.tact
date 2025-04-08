struct DeeplyOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct Container {
    opt: DeeplyOptional;
    x: Int?;
    y: Bool?;
}

contract OptionalStructs {
    storage: Container;

    init() {
        self.storage = Container{
            opt: DeeplyOptional{ foo: null, bar: true, baz: "hi" },
            x: 777,
            y: null,
        };
    }
}