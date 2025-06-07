struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    val: Mix;

    init() {
        self.val = Mix{
            a: 10,
            b: true,
            c: "ok",
            d: null,
            e: null,
            f: null
        };
    }
}
