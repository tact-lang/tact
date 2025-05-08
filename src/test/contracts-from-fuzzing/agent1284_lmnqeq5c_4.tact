struct InnerMost {
    val: Int = 7;
}

struct Middle {
    inner: InnerMost = InnerMost{};
}

contract TestContract {
    middle: Middle = Middle{};
}