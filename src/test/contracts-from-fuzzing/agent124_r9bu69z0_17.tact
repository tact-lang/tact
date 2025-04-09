struct Simple {
    x: Int;
}

struct WrapOptional {
    s: Simple?;
}

contract OptionalNestedStruct {
    wrap: WrapOptional;
    init() {
        self.wrap = WrapOptional{ s: null };
    }
}