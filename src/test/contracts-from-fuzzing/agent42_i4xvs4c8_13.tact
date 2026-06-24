struct OptionalNestedDefaults {
    num: Int? = null;
    txt: String? = null;
}

struct TopLevelOpt {
    nested: OptionalNestedDefaults?;
}

contract NestedOptDefaults {
    s: TopLevelOpt;

    init() {
        self.s = TopLevelOpt{
            nested: null
        };
    }
}