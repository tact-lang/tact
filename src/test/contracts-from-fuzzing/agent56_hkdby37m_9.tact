struct SDeepOpt {
    nestedOpt: Inner?;
}

struct Inner {
    val: Int;
    maybe: String?;
}

contract DeepOption {
    field: SDeepOpt;

    init() {
        self.field = SDeepOpt{ nestedOpt: Inner{ val:42, maybe:null } };
    }
}