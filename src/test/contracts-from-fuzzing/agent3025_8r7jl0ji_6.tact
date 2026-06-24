struct InnerMost {
    val: Int;
}

struct Mid {
    inner: InnerMost?;
}

contract TestContract {
    midOpt: Mid?;

    init() {
        self.midOpt = null;
    }
}