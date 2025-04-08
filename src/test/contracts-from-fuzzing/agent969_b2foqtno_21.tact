struct InnerOpts {
    foo: Int?;
    bar: Bool?;
}

contract OptionalOuterStruct {
    data: InnerOpts?;

    init() {
        self.data = InnerOpts{
            foo: null,
            bar: true
        };
    }
}
