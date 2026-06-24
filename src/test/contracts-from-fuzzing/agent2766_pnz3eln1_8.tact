struct HasOptional {
    flag: Bool?;
    value: Int?;
    txt: String?;
}

contract OptionalFieldsContract {
    data: HasOptional;

    init() {
        self.data = HasOptional{
            flag: null,
            value: null,
            txt: null,
        };
    }
}