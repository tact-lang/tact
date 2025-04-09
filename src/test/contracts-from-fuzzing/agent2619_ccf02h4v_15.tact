struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract MixContainer {
    s: Mix;

    init() {
        self.s = Mix{
            a: 1, b: null,
            c: true, d: false,
            e: "hi", f: null
        };
    }
}