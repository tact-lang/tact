struct NestedStrOpt {
    inner: String?;
}

contract OptionalNested {
    meta: NestedStrOpt;
    init() {
        self.meta = NestedStrOpt{ inner: null };
    }
}