struct NestedDeep {
    v1: Int;
    v2: String?;
}

struct Holder {
    nested: NestedDeep?;
}

contract OptionalDeep {
    state: Holder;

    init() {
        self.state = Holder{ nested: null };
    }
}