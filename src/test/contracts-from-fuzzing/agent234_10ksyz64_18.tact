struct Rec {
    s: String;
}

struct Wrap {
    inner: Rec?;
}

contract OptionalNestedTest {
    field: Wrap;

    init() {
        self.field = Wrap{ inner: Rec{ s: "hi" } };
    }
}