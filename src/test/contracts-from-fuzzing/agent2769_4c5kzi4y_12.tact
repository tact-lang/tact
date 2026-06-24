struct NestedStringOpt {
    s: String?;
}

struct Wrap {
    inner: NestedStringOpt;
}

contract OptionalNested {
    w: Wrap;

    init() {
        self.w = Wrap{ inner: NestedStringOpt{ s: null } };
    }
}