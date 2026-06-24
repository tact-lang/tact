struct Mix {
    one: Int;
    two: Bool?;
    three: String;
    four: Int?;
    five: Bool;
    six: String?;
}

contract MixedFields {
    mx: Mix;

    init() {
        self.mx = Mix{
            one: 1,
            two: null,
            three: "3",
            four: null,
            five: true,
            six: null,
        };
    }
}