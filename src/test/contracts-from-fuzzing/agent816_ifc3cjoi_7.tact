struct Deeply {
    content: String;
}

struct Middle {
    maybeDeep: Deeply?;
}

struct Outer {
    first: Middle;
    second: Middle?;
}

contract NestedOptStructs {
    storage: Outer;

    init() {
        self.storage = Outer {
            first: Middle { maybeDeep: Deeply { content: "Hello" } },
            second: null
        };
    }
}