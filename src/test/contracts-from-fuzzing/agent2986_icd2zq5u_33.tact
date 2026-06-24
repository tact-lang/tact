// deeply nested optional struct inside struct inside optionals
struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost?;
}

contract OptionalInOptionalDeep {
    m: Middle?;

    init() {
        self.m = null;
    }
}