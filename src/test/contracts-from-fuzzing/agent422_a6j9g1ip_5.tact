struct Inner {
    a: Int;
    b: Bool;
}

struct MidOpt {
    innerOpt: Inner?;
}

contract OptionalNestedTest {
    field: MidOpt;

    init() {
        self.field = MidOpt{ innerOpt: null };
    }
}