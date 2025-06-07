struct Nested {
    a: Int;
    b_opt: Bool?;
    s_opt: String?;
}

contract TestContract {
    nested: Nested;
    flag_opt: Bool?;
    num_opt: Int?;
    str_opt: String?;

    init() {
        self.nested = Nested{
            a: 1,
            b_opt: null,
            s_opt: null,
        };
        self.flag_opt = null;
        self.num_opt = null;
        self.str_opt = null;
    }
}