struct SOpt {
    y: Int? = null
}

struct WrapOpt {
    nested: SOpt? = null
}

contract OptOptFallback {
    val: WrapOpt;
    init() {
        self.val = WrapOpt{};
    }
}