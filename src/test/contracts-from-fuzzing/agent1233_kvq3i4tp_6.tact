struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract NestedOptionalField {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{foo:null, bar:null, baz:null};
    }
}