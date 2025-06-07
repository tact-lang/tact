struct Mix {
    i: Int;
    b: Bool;
    s: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract MixedFields {
    f: Mix;

    init() {
        self.f = Mix{
            i: 7,
            b: true,
            s: "x",
            optI: 77,
            optB: null,
            optS: "y",
        };
    }
}