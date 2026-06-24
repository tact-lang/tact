struct Deep {
    one: Int = 1;
    two: Int = 2;
    three: Int?; // optional field, default null
    four: Bool = true;
    five: String = "hello";
}

contract OptionalFields {
    deepData: Deep;

    init() {
        self.deepData = Deep{
            one: 100,
            two: 200,
            three: null,
            four: false,
            five: "world",
        };
    }
}