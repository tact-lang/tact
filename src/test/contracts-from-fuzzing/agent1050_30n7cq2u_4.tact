struct OptionStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalStructField {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            a: null,
            b: true,
            s: null
        };
    }
}