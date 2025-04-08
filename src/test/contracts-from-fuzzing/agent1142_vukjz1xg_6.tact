struct MixedTypes {
    count: Int;
    flag: Bool;
    note: String;
    content: Cell;
    address: Address;
}

contract ManyTypeFields {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            count: 5,
            flag: true,
            note: "hi",
            content: emptyCell(),
            address: myAddress()
        };
    }
}