struct InnerMost { z: Int = 9; }
struct Inner { y: InnerMost = InnerMost{}; }

contract TestContract {
    inner: Inner = Inner{};

    init() {}
}