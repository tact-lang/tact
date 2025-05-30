struct OptionalNestedRecord {
    val: Int?;
}

struct WrapWithOpt {
    nestedOpt: OptionalNestedRecord?;
}

contract OptionalOfStructOptional {
    s: WrapWithOpt;

    init() {
        self.s = WrapWithOpt{ nestedOpt: null };
    }
}