struct InnerMost {
    z: String?;
}

struct Middle {
    inner: InnerMost;
}

contract ParamDeepNested(
    data: Middle
) {
    // no init
}