struct MixTypes {
    label: String;
    amount: Int;
    owner: Address;
    active: Bool;
    optVal: Int?;
}

contract MixTypesStructField {
    data: MixTypes;
    init() {
        self.data = MixTypes {
            label: "my label",
            amount: 100,
            owner: myAddress(),
            active: true,
            optVal: null
        };
    }
}