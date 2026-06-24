struct S {
    opt_bool: Bool?;
    opt_str: String?;
    opt_num: Int?;
}

contract OptionalsStruct {
    s: S;

    init() {
        self.s = S{opt_bool: null, opt_str: null, opt_num: null};
    }
}