// Struct with nested optional nested inside optional struct wrapped in optional
struct InnerMostNested {
    v: Int?;
}

struct InnerWrap {
    deep: InnerMostNested?;
}

contract OptionalWrappedNested {
    data: InnerWrap?;

    init() {
        self.data = null;
    }
}