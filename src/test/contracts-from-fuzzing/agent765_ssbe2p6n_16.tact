struct MixOpt {
    int_opt: Int?;
    bool_opt: Bool?;
    str_opt: String?;
    int_field: Int;
    bool_field: Bool;
    str_field: String;
}

contract MixedOptionals {
    data: MixOpt;
    init() {
        self.data = MixOpt{
            int_opt: null,
            bool_opt: null,
            str_opt: null,
            int_field: 111,
            bool_field: true,
            str_field: "hello"
        };
    }
}