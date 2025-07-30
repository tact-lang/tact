struct OptAndDefaults {
    int_opt: Int?;
    flag_opt: Bool?;
    s: String = "abc";
}

contract TestContract {
    data: OptAndDefaults;

    init() {
        self.data = OptAndDefaults{
            int_opt: 12,
            flag_opt: null,
            s: "xyz"
        };
    }
}
