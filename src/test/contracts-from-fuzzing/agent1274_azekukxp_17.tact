struct Combo {
    number: Int;
    flag: Bool;
    text: String;
    address: Address;
    optNum: Int?;
}

contract VariousPersistent {
    state: Combo;

    init() {
        self.state = Combo{
            number: 100,
            flag: false,
            text: "hi",
            address: myAddress(),
            optNum: null,
        };
    }
}