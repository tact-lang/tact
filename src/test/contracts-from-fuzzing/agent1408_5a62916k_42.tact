struct InnerMost {
    val: Int;
}

struct InnerOptional {
    nested: InnerMost? = null;
}

contract TestContract {
    field: InnerOptional? = null;

    init() {
        self.field = InnerOptional{
            nested: InnerMost{val: 777},
        };
    }
}