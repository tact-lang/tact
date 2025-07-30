struct InnerMost {
    i: Int;
}

struct MiddleOpt {
    m: InnerMost?;
}

struct OuterOpt {
    nested: MiddleOpt?;
}

contract DeepOptionalTest {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{};
    }
}
