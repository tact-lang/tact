struct OptionalNestedDefault {
    inner: Int? = null;
}

struct WithOpt {
    opt: OptionalNestedDefault = OptionalNestedDefault{};
}

contract OptionalDefContract {
    w: WithOpt;

    init() {
        self.w = WithOpt{};
    }
}