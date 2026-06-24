struct StringStruct {
    name: String;
    description: String;
    note: String?;
}

contract StringyStorage {
    meta: StringStruct;

    init() {
        self.meta = StringStruct{
            name: "MyContract",
            description: "A smart contract",
            note: null
        };
    }
}