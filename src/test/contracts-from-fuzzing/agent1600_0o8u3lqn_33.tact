struct EmbeddedDefaultOpt {
    val: Int? = null;
}

struct OuterEmbeddedOpt {
    item: EmbeddedDefaultOpt? = null;
}

contract DefaultOptNested {
    d: OuterEmbeddedOpt;

    init() {
        self.d = OuterEmbeddedOpt{};
    }
}