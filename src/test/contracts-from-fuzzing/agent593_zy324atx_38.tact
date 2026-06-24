// Deep nest with optional inside nested struct inside optional
struct InnerMost {
    val: Int?;
}

struct Nested {
    inner: InnerMost?;
}

contract DeepOptChain {
    s: Nested? = null;
    init() {
        self.s = Nested{ inner: InnerMost{ val: 10 } };
    }
}