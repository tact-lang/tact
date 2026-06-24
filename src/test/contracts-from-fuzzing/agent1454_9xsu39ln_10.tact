struct Nested {
    x: Int;
    y: Bool;
}

struct OuterOpt {
    inner: Nested?;
}

contract OptionalNestedTest {
    stateVar: OuterOpt;

    init() {
        self.stateVar = OuterOpt{
            inner: null
        };
    }
}