struct Params {
    amount: Int as coins;
    flag: Bool;
    note: String;
    optnum: Int?;
    optnote: String?;
}

contract TestContract {
    p: Params;

    init() {
        self.p = Params{
            amount: ton("1"),
            flag: true,
            note: "hello",
            optnum: null,
            optnote: null
        };
    }

    receive() {
        self.p = Params{
            amount: ton("2"),
            flag: false,
            note: "bye",
            optnum: 42,
            optnote: "some note"
        };
    }
}