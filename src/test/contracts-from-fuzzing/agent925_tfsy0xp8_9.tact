struct DeeplyOptional {
    foo: Int?;
    bar: String?;
}

contract OptionalFields {
    val: DeeplyOptional;

    init() {
        self.val = DeeplyOptional{
            foo: null,
            bar: null,
        };
    }
}