struct Mix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
    f: String;
}

contract TestContract {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            a: null,
            b: true,
            c: null,
            d: 10,
            e: false,
            f: "str",
        };
    }
}