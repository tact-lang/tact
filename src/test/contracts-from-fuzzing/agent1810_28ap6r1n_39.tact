struct WrapOpt {
    x: Int?;
}

struct NestedOpt {
    w: WrapOpt?;
}

contract DeepNestedOpt {
    val: NestedOpt?;

    init() {
        self.val = null;
    }
}