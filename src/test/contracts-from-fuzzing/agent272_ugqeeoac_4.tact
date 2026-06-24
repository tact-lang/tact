contract OptionalMix {
    int_field: Int;
    bool_field_opt: Bool?;
    str_field_opt: String?;

    init() {
        self.int_field = 77;
        self.bool_field_opt = null;
        self.str_field_opt = null;
    }
}