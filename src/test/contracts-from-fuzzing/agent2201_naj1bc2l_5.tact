struct OptionalInner {
    x: Int = 10;
    y: String = "inner";
}

struct HasOptional {
    maybeX: Int?;
    maybeStr: String?;
    maybeNested: OptionalInner?;
}

contract OptionalsTest {
    opt: HasOptional = HasOptional{
        maybeX: null,
        maybeStr: null,
        maybeNested: null
    };

    init() {
        self.opt = HasOptional{
            maybeX: 42,
            maybeStr: "hello",
            maybeNested: OptionalInner{ x:100, y:"world" }
        };
    }
}