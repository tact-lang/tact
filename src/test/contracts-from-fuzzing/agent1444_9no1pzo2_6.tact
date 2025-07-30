struct InnerMost {
    val: String;
}

struct Middle {
    inner: InnerMost?;
}

contract OptionalNestedStruct {
    state: Middle;

    init() {
        self.state = Middle{ inner: null };
    }
}
