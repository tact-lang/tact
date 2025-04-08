contract OptionalFieldTest {
    optional_num: Int?;
    optional_str: String?;
    optional_bool: Bool?;

    init() {
        self.optional_num = null;
        self.optional_str = null;
        self.optional_bool = true;
    }
}