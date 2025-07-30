struct BigNested {
    one: Int;
    two: Int?;
    three: String;
    four: Bool?;
    five: Int as int64;
    six: Int?;
}

contract NestedAsField {
    x: BigNested;
    y: BigNested?;

    init() {
        self.x = BigNested{
            one: 1,
            two: 2,
            three: "hi",
            four: true,
            five: 1000,
            six: null
        };

        self.y = null;
    }
}
