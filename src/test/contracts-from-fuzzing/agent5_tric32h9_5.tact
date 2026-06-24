struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct Outer {
    inner: InnerOpt;
    s: String?;
}

contract NestedOptionals {
    content: Outer;

    init() {
        self.content = Outer{
            inner: InnerOpt{
                foo: 55,
            },
        };
    }
}