struct NestedOptional {
    deep: InnerOption?;
}

struct InnerOption {
    val: Bool?;
}

contract OptOpt {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            deep: InnerOption{val: null}
        };
    }
}