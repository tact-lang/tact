struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract TestContract {
    data: Mix;
    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: "hi",
            f: null,
            g: myAddress(),
            h: null
        };
    }
}