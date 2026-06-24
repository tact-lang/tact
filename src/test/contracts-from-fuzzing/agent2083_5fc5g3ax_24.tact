contract NestedOptionDefault {
    optS: String? = null;
    optI: Int? = null;

    init() {
        self.optS = "hi";
        self.optI = null;
    }
}
