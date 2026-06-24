struct StrNested {
    text: String;
    amount: Int;
    active: Bool;
}

contract StrNest {
    sn: StrNested;
    init() {
        self.sn = StrNested{
            text: "test",
            amount: 50,
            active: true,
        };
    }
}