struct ManyNestedOpts {
    inner1: Int?;
    inner2: String?;
    inner3: Bool?;
}

struct MidNested {
    left: ManyNestedOpts?;
    right: ManyNestedOpts?;
}

contract DeeplyOptioned {
    top: MidNested?;

    init() {
        self.top = null;
    }
}