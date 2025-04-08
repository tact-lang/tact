struct InnerOpts {
    foo: Int?;
    bar: Bool?;
}

contract OptOuterStruct {
    data: InnerOpts?;

    init() {
        self.data = null;
    }
}