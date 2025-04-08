struct WithManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract Combos {
    store: WithManyTypes;

    init() {
        self.store = WithManyTypes{
            a: 1,
            b: true,
            c: myAddress(),
            d: "ok",
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}