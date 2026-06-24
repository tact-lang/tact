struct OptionalComposition {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
}

contract OptionalFieldsContract {
    data: OptionalComposition;
    
    init() {
        self.data = OptionalComposition{
            f1: null,
            f2: true,
            f3: null,
            f4: null
        };
    }
}
