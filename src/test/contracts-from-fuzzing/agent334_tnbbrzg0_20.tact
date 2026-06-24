struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
}
contract Test {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            a: 1,
            b: null,
            c: "str",
            d: true,
            e: 42
        };
    }
}