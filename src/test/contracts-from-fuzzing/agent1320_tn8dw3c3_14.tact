struct OptionalNestedDefault {
    val: Int? = null;
    optInner: Inner? = null;
}

struct Inner {
    flag: Bool;
}

contract OptNestedDef {
    data: OptionalNestedDefault = OptionalNestedDefault{};

    receive() {
        self.data = OptionalNestedDefault{
            val: 99,
            optInner: Inner{ flag: true }
        };
    }
}