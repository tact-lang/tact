struct InnerOpts {
    foo: Int?;
    bar: Bool?;
}

contract OptOuterStruct {
    data: InnerOpts?;

    init() {
        self.data = InnerOpts{
            foo: null,
            bar: null,
        };
    }
}