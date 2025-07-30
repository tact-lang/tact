struct DeepOptional {
    s: String?;
}

struct HoldsDeep {
    opt: DeepOptional;
}

contract OptNestedString {
    data: HoldsDeep;
    init() {
        self.data = HoldsDeep{ opt: DeepOptional{ s: null } };
    }
}