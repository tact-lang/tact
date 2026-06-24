struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptionalStruct {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{foo: null, bar: null};
    }
}