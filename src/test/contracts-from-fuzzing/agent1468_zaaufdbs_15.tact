struct NestedOptional {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool?;
}

contract TestOpt {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            innerOpt: null,
        };
    }
}