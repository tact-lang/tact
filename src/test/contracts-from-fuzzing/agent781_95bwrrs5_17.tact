struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
    e: Address;
}

contract TestContract {
    field: Combo;

    init() {
        self.field = Combo{
            a: 42,
            b: null,
            c: "hi",
            d: null,
            e: myAddress()
        };
    }
}