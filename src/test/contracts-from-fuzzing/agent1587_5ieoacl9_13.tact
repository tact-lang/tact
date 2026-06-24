struct MultiOption {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract OptionalFields {
    m: MultiOption;

    init() {
        self.m = MultiOption{
            intOpt:null,
            boolOpt:null,
            strOpt:null
        };
    }
}