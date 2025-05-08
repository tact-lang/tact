struct Inner {
    number: Int;
}

struct WithOptDefault {
    maybe: Inner? = null;
}

contract OptionalDefault {
    data: WithOptDefault;

    init() {
        self.data = WithOptDefault{};
    }
}