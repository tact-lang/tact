struct ManyFields {
    a1: Int;
    a2: Bool;
    a3: Address;
    a4: String;
    a5: Bool;
    a6: Int;
    a7: String;
    a8: Address;
    a9: Int;
    a10: Bool;
}

contract TestContract {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            a1: 1,
            a2: true,
            a3: myAddress(),
            a4: "hi",
            a5: false,
            a6: 6,
            a7: "test",
            a8: myAddress(),
            a9: 9,
            a10: true
        };
    }
}