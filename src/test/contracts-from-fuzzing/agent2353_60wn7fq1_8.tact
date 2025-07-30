struct Inner {
    val: Int;
    text: String?;
}

struct MiddleOpt {
    inner: Inner?;
}

contract NestedOptionals {
    state: MiddleOpt;

    init() {
        self.state = MiddleOpt{
            inner: null
        };
    }
}