struct OptionalDeeper {
    flag: Bool?;
    text: String?;
    num: Int?;
}

contract OptionalNestedPersistence {
    data: OptionalDeeper?;
    
    init() {
        self.data = OptionalDeeper{
            flag: null,
            text: null,
            num: 42,
        };
    }
}