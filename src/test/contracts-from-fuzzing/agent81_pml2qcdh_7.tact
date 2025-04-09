struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Address;
    e: String?;
    f: Int?;
}

contract Test {
    m: Mix;

    init() {
        self.m = Mix{
            a: 1,
            b: null,
            c: "str",
            d: myAddress(),
            e: "opt",
            f: 42
        };
    }
}
