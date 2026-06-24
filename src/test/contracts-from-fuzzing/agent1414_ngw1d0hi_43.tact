struct OptNested {
    foo: Int? = null;
    bar: Bool? = null;
}

struct OuterOpt {
    inner: OptNested? = null;
    label: String? = null;
}

contract DeepOptDefaults {
    x: OuterOpt;

    init() {
        self.x = OuterOpt{};
    }
}