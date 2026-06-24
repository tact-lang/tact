contract OptionalBoolAndStrings {
    name: String?;
    description: String?;
    enabled: Bool?;

    init() {
        self.name = null;
        self.description = null;
        self.enabled = null;
    }
}