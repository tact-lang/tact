struct NestedOptional {
    inner: InnerOptional?;
}

struct InnerOptional {
    val: Int?;
}

contract OptionalHolder {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{
            inner: InnerOptional{
                val: null
            }
        };
    }
}
