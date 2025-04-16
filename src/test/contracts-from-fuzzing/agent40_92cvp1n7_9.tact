struct Outer {
    innerOptional: Inner?;
}

struct Inner {
    flag: Bool;
    nestedOpt: String?;
}

contract DeepNestedOptional {
    data: Outer;

    init() {
        self.data = Outer{ innerOptional: null };
    }
}