struct Inner {
    x: Int? = null;
}

struct Wrapper {
    innerOpt: Inner? = null;
}

contract TestContract {
    data: Wrapper = Wrapper{};
    init() {}
}
