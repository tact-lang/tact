struct InnerMost {
    info: String?;
}

struct Inner {
    val: InnerMost;
}

struct Wrapper {
    inner: Inner;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Inner{
                val: InnerMost{ info: null }
            }
        };
    }
}