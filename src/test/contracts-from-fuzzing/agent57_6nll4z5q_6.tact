struct NestedOpts {
    foo: Int?;
    bar: Bool?;
}

contract OptOfStruct {
    data: NestedOpts?;

    init() {
        self.data = NestedOpts{
            foo: 1,
            bar: false
        };
    }
}