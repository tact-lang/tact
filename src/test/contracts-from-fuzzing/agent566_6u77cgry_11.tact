struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
}

contract OptionalMix {
    val: Mix;

    init() {
        self.val = Mix{
            a: 5,
            b: null,
            c: "text",
            d: false,
            e: null
        };
    }
}