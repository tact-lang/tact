struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalSer {
    nested: NestedOpt?;

    init() {
        self.nested = NestedOpt{ foo: 100, bar: true };
    }
}