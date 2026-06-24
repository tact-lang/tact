struct NestedOptional {
    maybeInner: Inner?;
}

struct Inner {
    val: Int;
    str: String;
    flag: Bool;
}

contract OptionalWrapper {
    stored: NestedOptional = NestedOptional{
        maybeInner: null
    };

    init() {
        self.stored = NestedOptional{
            maybeInner: Inner{
                val: 42, str: "abc", flag: true
            }
        };
    }
}
