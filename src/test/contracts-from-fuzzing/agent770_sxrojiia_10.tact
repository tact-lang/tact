struct Mix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "hey",
            f: null
        };
    }
}