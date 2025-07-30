struct InnerOptional {
    f: Int?;
}

struct NestedOptional {
    inner: InnerOptional?;
}

contract OptionalOfStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{inner: null};
    }
}