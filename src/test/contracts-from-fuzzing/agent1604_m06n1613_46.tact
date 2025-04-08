struct DeepDef {
    x: Int = 1;
}

struct OuterDef {
    nested: DeepDef?;
    val: Int = 2;
}

contract OptionalDefaults {
    s: OuterDef;

    init() {
        self.s = OuterDef { nested: null };
    }

    receive() {}
}