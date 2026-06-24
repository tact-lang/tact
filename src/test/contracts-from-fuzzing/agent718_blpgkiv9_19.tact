struct NestedWrapOptional {
    inner: Int;
}

struct WrapOptional {
    nested: NestedWrapOptional?;
}

contract NestedWrapOptionalContract {
    val: WrapOptional;
    init() {
        self.val = WrapOptional{ nested: null };
    }
}