struct Combo {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: false,
            c: myAddress(),
            d: "hello",
            e: null,
            f: null,
            g: null,
            h: null,
        };
    }
}