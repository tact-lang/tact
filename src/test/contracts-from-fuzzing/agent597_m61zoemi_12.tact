struct DefaultNested {
    foo: Int = 1;
    bar: String = "x";
}

struct WithDefaultNested {
    def: DefaultNested;
    val: Int;
}

contract InitDefaultNested {
    s: WithDefaultNested;

    init() {
        self.s = WithDefaultNested{
            def: DefaultNested{},
            val: 42,
        };
    }
}