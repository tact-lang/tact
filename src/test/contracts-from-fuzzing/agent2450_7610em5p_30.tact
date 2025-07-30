// nested optional levels: struct? inside struct? inside struct?
struct InnerMost {
    a: Int;
}

struct Mid {
    b: InnerMost?;
}

struct Out {
    c: Mid?;
}

contract DeepNestedOpt {
    state: Out?;

    init() {
        self.state = null;
    }
}
