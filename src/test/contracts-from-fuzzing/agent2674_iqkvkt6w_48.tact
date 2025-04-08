// top optional struct with default null, then assigned
struct OptionalWrap {
    x: Int? = null;
}

contract OptionalWrapOverride {
    w: OptionalWrap;

    init() {
        self.w = OptionalWrap{ x: 100 };
    }
}