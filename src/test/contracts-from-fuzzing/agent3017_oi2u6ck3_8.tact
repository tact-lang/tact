struct OneOptionalNested {
    maybeInner: Inner?;
}

struct Inner {
    maybeVal: Int?;
}

contract Test {
    content: OneOptionalNested;

    init() {
        self.content = OneOptionalNested{
            maybeInner: Inner{ maybeVal: 42 }
        };
    }
}
