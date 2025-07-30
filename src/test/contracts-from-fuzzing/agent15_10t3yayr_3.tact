struct SOpt {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptionalStruct {
    val: SOpt;

    init() {
        self.val = SOpt{
            foo: null,
            bar: null,
            baz: null,
        };
    }
}