struct CompositeOptional {
    flag: Bool?;
    text: String?;
    address: Address?;
    amount: Int?;
}

contract OptionalStorage {
    data: CompositeOptional;

    init() {
        self.data = CompositeOptional{
            flag: null,
            text: null,
            address: null,
            amount: null,
        };
    }
}