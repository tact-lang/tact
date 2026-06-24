struct InnerMost {
    val: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

contract NestedOptTop {
    state: MiddleOpt? = null;

    init() {
        self.state = null;
    }
}