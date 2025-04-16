struct AllTypes {
    number: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
    optStr: String?;
}

contract MultiTypeFields {
    state: AllTypes;

    init() {
        self.state = AllTypes{
            number: 7,
            flag: true,
            text: "test",
            optInt: null,
            optStr: null
        };
    }
}
