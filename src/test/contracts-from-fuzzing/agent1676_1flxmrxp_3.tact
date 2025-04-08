struct InnerOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalNested {
    val: InnerOpt;

    init() {
        self.val = InnerOpt{ foo: null, bar: true, baz: null };
    }
}