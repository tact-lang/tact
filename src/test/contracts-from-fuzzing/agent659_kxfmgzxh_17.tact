struct DeepOpt {
    nested: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalDeepField {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{nested: null};
    }
}
