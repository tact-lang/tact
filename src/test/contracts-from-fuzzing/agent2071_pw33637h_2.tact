struct HasOptional {
    flag: Bool?;
    number: Int?;
    description: String?;
}

contract OptionalStruct {
    data: HasOptional;
    
    init() {
        self.data = HasOptional {
            flag: null,
            number: null,
            description: null,
        };
    }
}