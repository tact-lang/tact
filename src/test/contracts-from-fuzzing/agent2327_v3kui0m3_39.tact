struct OptionalWrap {
    inner: Wrap?;
}

struct Wrap {
    a: Int;
    b: Bool;
}

contract OptionalWrapTest {
    s: OptionalWrap;

    init() {
        self.s = OptionalWrap{
            inner: Wrap{ a:1, b:true}
        };
    }
}
