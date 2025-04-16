struct MultiOption {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

contract ManyNullables {
    data: MultiOption;

    init() {
        self.data = MultiOption{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null
        };
    }
}