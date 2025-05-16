contract FieldOmittingDefaults {
    x: Int = 1;
    y: Bool = false;
    s: String = "hi";

    init() {
        self.y = true;
    }
}
