struct Mix {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    nested: Nested;
}

struct Nested {
    n1: Int;
    n2: Bool;
}

contract MixTypes {
    m: Mix;

    init() {
        self.m = Mix{
            i: 3,
            b: false,
            s: "mix",
            o: null,
            nested: Nested{
                n1: 12,
                n2: true
            }
        };
    }
}