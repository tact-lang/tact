contract ContrWithOptionalAndDefault {
    count: Int? = null;
    name: String = "default";
    init() {
        self.count = null;
        self.name = "changed";
    }
}