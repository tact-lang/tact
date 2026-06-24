struct Crazy {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Int;
    f: String;
    g: Bool;
    h: Address;
}

contract TestContract {
    mixed: Crazy;

    init() {
        self.mixed = Crazy{
            a: null,
            b: null,
            c: null,
            d: null,
            e: 1,
            f: "hello",
            g: true,
            h: myAddress(),
        };
    }
}