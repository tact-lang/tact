struct Record {
    id: Int;
    name: String;
}

contract OptionalStruct {
    rec: Record?;

    init() {
        self.rec = Record{
            id: 1,
            name: "Test",
        };
    }

    receive() {}
}
