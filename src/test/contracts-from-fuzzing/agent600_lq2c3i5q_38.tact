// deeply nested optional structs with default nulls and serialization
struct InnerMost {
    x: Int? as uint2 = null;
}
struct Inner {
    sub: InnerMost? = null;
}
struct Mid {
    inner: Inner? = null;
}
struct Top {
    mid: Mid? = null;
}
contract DefDeepOptSer {
    data: Top;
    init() {
        self.data = Top{};
    }
}