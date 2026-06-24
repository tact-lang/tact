struct MultiOption {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionsCombined {
    data: MultiOption;
    
    init() {
        self.data = MultiOption{
            optInt: null,
            optBool: true,
            optStr: null
        };
    }
}