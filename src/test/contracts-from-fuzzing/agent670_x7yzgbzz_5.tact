struct NestedOptional {
    innerOpt: Int?;
}

struct Wrapper {
    maybeInner: NestedOptional?;
}

contract OptionalDeep {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            maybeInner: null,
        };
    }
}