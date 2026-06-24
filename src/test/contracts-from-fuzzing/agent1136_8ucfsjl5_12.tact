contract OptionalNonNullDefaults {
    config: ConfigStruct;

    init() {
        self.config = ConfigStruct{};
    }
}

struct ConfigStruct {
    name: String? = "default";
    count: Int? = 5;
    enabled: Bool? = true;
}
