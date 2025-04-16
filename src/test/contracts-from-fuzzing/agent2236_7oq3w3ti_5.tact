struct Mix {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    sb: String?;
}

contract FieldMix {
    m: Mix;

    init() {
        self.m = Mix{
            i: 100,
            b: true,
            s: "yo",
            o: null,
            sb: null
        };
    }
}