struct InnerNested {
    flag: Bool;
    text: String;
}

struct OuterNested {
    maybeInner: InnerNested?;
}

contract TestContract {
    outer: OuterNested;

    init() {
        self.outer = OuterNested {
            maybeInner: null,
        };
    }
}