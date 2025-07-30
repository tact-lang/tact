struct DeepNestedOpt {
    inner: String?;
}

struct WrapNestedOpt {
    nested: DeepNestedOpt?;
}

contract NestedOptionalDeep {
    field: WrapNestedOpt?;

    init() {
        self.field = null;
    }
}