struct Optionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract ContractWithOptionals {
    data: Optionals;

    init() {
        self.data = Optionals{
            optInt: null,
            optBool: true,
            optString: null,
        };
    }
}