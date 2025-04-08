struct NestedOptionDefaults {
    a: Int? = null;
    b: String? = null;
}

contract DefaultsOptional {
    data: NestedOptionDefaults;

    init() {
        self.data = NestedOptionDefaults{};
    }
}
