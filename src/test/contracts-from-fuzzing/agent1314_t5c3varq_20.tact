struct MultiOptNested {
    foo: Int?;
    bar: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    baz: String?;
    val: Int;
}

contract OptNestedTest {
    dat: MultiOptNested;

    init() {
        self.dat = MultiOptNested {
            foo: null,
            bar: null,
            nested: null,
        };
    }
}