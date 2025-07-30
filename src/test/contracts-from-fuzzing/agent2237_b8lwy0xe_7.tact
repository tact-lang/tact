struct ContainsInline {
    foo: Int;
    bar: InlineInner;
}

struct InlineInner {
    baz: Bool;
    qux: String;
}

contract InlineStructTest {
    data: ContainsInline;

    init() {
        self.data = ContainsInline{
            foo: 77,
            bar: InlineInner{
                baz: true,
                qux: "ok"
            }
        };
    }
}