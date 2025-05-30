struct InnerMost {
    foo: Int;
    bar: Bool;
}
struct Inner {
    baz: String;
    inn: InnerMost;
}
contract NestedSameAndDifferent {
    level: Inner;

    init() {
        self.level = Inner{ baz:"hi", inn: InnerMost{ foo:3, bar:false } };
    }
}