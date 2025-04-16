struct DeepOpt {
    a: Int? = null;
    b: Inner? = null;
}

struct Inner {
    x: Int = 5;
    y: Bool? = null;
}

contract TestContract {
    deep: DeepOpt = DeepOpt{};
}
