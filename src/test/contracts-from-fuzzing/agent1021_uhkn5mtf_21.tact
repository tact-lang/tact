// optional struct chain with defaults for inner
struct InnerDefault {
    x: Int = 11;
}

struct OuterOpt {
    inner: InnerDefault?;
}

contract OuterOptField {
    s: OuterOpt = OuterOpt{
        inner: null,
    };
}