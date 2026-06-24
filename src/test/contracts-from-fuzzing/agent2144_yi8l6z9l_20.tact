struct NestedOptStructs {
    innerOpt: Inner?;
}

struct Inner {
    foo: Int?;
}

contract DeepOpt {
    data: NestedOptStructs;

    init() {
        self.data = NestedOptStructs{ innerOpt: Inner{ foo: 42 } };
    }
}
