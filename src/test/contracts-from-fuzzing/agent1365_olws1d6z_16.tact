struct MultiOption {
    intOpt: Int?;
    boolOpt: Bool?;
    txtOpt: String?;
}

contract ManyOptionals {
    field: MultiOption;

    init() {
        self.field = MultiOption{
            intOpt: null,
            boolOpt: null,
            txtOpt: null
        };
    }
}