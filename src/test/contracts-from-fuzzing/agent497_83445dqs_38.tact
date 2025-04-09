contract OverwriteDefaults {
    x: String = "default";

    init() {
        self.x = "in init";
    }
}