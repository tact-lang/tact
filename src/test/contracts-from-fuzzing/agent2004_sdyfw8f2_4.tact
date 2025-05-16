struct InnerMost {
    x: Int? = null;
}

struct InnerMid {
    child: InnerMost? = null;
}

contract DeepNested {
    state: InnerMid = InnerMid{};
    init() {}
}
