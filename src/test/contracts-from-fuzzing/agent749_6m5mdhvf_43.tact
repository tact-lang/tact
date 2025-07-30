struct OptionalInside {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract MultipleOptionStruct {
    val: OptionalInside;

    init() {
        self.val = OptionalInside{
            foo: null,
            bar: null,
            baz: "hello"
        };
    }
}