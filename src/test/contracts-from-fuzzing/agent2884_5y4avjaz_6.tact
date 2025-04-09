struct InnerMost { x: Int? = null; }
struct Inner { im: InnerMost? = null; }

contract TestContract {
    inner: Inner? = null;

    init() {}
}