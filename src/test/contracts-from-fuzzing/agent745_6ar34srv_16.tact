struct S {
    flag: Bool;
    amount: Int as coins;
    note: String?;
}

contract SerializedFields {
    data: S;
    init() {
        self.data = S{
            flag: true,
            amount: ton("1"),
            note: null
        };
    }
}