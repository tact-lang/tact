struct NestedOpt {
    inner: Int?;
}

struct Container {
    a: Bool;
    b: NestedOpt;
    c: String?;
}

contract NestingOptionals {
    field: Container;
    init() {
        self.field = Container{
            a: true,
            b: NestedOpt{ inner: 5 },
            c: null
        };
    }
}