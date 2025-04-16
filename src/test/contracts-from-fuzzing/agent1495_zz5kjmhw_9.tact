struct NestedOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int;
    comment: String?;
}

contract ContractOptOptional {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{
            inner: null
        };
    }
}
