struct InnerMost {
    deep: Int;
}

struct Middle {
    m: InnerMost?;
}

contract OptionalNestedField {
    f: Middle;

    init() {
        self.f = Middle{ m: null };
    }
}