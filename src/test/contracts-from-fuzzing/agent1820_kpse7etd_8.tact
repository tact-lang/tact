struct NestedOptional {
    optInner: Inner?;
}

struct Inner {
    deeper: Deeper;
}

struct Deeper {
    value: Int?;
}

contract TestContract {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            optInner: Inner{
                deeper: Deeper{
                    value: 42,
                },
            },
        };
    }
}