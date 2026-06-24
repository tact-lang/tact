contract DefaultAssign {
    int_val: Int = -1;
    bool_val: Bool = true;
    str_val: String = "zzz";

    init() {
        self.int_val = 123;
        self.bool_val = false;
        self.str_val = "abc";
    }
}