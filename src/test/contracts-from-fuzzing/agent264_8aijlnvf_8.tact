struct OptInner {
    foo: Int?;
    bar: Bool?;
}

struct OptOuter {
    baz: OptInner?;
}

contract OptionalChain {
    data: OptOuter;

    init() {
        self.data = OptOuter{
            baz: OptInner{
                foo: null,
                bar: true,
            },
        };
    }
}