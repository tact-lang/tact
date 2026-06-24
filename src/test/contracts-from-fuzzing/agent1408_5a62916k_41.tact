struct OptionalInner {
    x: Int;
}

struct WithDefaultOptional {
    inner: OptionalInner? = null;
}

contract TestContract {
    data: WithDefaultOptional;

    init() {
        self.data = WithDefaultOptional{
            inner: OptionalInner{x:42},
        };
    }
}