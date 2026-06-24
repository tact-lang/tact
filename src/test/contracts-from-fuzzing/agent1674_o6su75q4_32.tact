struct InnerMost {
    small: Int as uint8;
    info: String?;
}

struct Middle {
    inner: InnerMost;
    optFlag: Bool?;
}

contract ParamDeepNest(
    mid: Middle,
    x: Int as uint32,
) {
}