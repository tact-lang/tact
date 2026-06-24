struct ContractData {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract OptionalMix {
    val: ContractData;

    init() {
        self.val = ContractData{
            a: 1,
            b: null,
            c: "test",
            d: null
        };
    }
}