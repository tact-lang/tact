struct NestedOptionDefault {
    inner: InnerOpt?;
}

struct InnerOpt {
    v: Int = 99;
}

contract NestedOptDefaults {
    x: NestedOptionDefault;

    init() {
        self.x = NestedOptionDefault{ inner: InnerOpt{} };
    }
}