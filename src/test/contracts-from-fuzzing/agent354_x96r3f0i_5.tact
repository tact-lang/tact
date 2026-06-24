struct NestedOptional {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract OptionalOfStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ innerOpt: null };
    }
}
