struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract Opts {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ foo: null, bar: null, baz: null };
    }
}