struct WrapOpt {
    inside: Inner?;
}

struct Inner {
    val: Int;
}

contract OptWrapper {
    w: WrapOpt;
    init() {
        self.w = WrapOpt{ inside: null };
    }
}