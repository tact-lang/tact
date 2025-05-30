struct NestedOptionalsDefault {
    flag: Bool = true;
    note: String? = null;
}

contract OptDefaults {
    store: NestedOptionalsDefault;

    init() {
        self.store = NestedOptionalsDefault{};
    }
}