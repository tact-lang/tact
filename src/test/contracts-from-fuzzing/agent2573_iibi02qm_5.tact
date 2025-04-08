struct Child {
    foo: Int?;
    bar: Bool?;
}

struct Parent {
    a: Int?;
    b: String?;
    c: Child;
}

contract DeepOpts {
    state: Parent;

    init() {
        self.state = Parent{
            a: 42,
            b: null,
            c: Child{
                foo: null,
                bar: true,
            },
        };
    }
}