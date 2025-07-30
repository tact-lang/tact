struct DataBits {
    small: Int as int8;
    medium: Int as int64;
    name: String;
    flag: Bool?;
}

contract OptSerNested {
    data_opt: DataBits?;

    init() {
        self.data_opt = DataBits{
            small: -7,
            medium: 123456,
            name: "check",
            flag: null
        };
    }
}