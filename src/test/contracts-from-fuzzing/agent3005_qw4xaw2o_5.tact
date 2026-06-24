struct OptionalMix {
    foo: Int;
    bar: Bool?;
    baz: String?;
}

contract OptFields {
    val: OptionalMix;

    init() {
        self.val = OptionalMix{
            foo: 123,
            bar: true,
            baz: null
        };
    }
}