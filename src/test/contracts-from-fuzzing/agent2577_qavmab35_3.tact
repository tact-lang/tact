struct NestedOptional {
    innerOpt: Inner?;
    flag: Bool;
}

struct Inner {
    value: Int;
}

contract OptionalContract {
    state: NestedOptional;

    init() {
        self.state = NestedOptional{
            innerOpt: null,
            flag: false,
        };
    }
}
