struct Mix {
    i: Int;
    s: String;
    b: Bool;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract MixedFields {
    f: Mix;

    init() {
        self.f = Mix{
            i: 7,
            s: "s",
            b: true,
            o1: null,
            o2: null,
            o3: null,
        };
    }
}
