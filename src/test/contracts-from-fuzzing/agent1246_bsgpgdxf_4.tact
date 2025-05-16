struct NestOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct WrapOpt {
    inner: NestOpt?;
}

contract OptionalNest {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            inner: NestOpt{
                foo: 42,
                bar: false,
                baz: "opt",
            },
        };
    }
}