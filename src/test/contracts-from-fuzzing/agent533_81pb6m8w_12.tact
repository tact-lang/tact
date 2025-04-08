struct MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
}

contract Test {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            a: null,
            b: true,
            c: null,
            d: myAddress()
        };
    }
}