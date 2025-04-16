struct NOptional {
    opt: Inner?;
}

struct Inner {
    data: Nested?;
}

struct Nested {
    value: String;
}

contract DeepOptTest {
    f: NOptional;

    init() {
        self.f = NOptional{
            opt: Inner{
                data: null,
            },
        };
    }
}
