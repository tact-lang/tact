struct InlineInit {
    foo: Int = 1;
    bar: Bool?;
    baz: String = "baz";
}

contract DefaultsInsideStruct {
    s: InlineInit;

    init() {
        self.s = InlineInit {
            foo: 42,
            bar: null,
            baz: "banana"
        };
    }
}