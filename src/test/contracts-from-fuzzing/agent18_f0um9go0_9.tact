struct Mix {
    one: Int;
    two: Bool?;
    three: String;
    four: Bool;
    five: String?;
    six: Int?;
}

contract MixContract {
    val: Mix;
    init() {
        self.val = Mix{
            one: 1,
            two: null,
            three: "abc",
            four: true,
            five: null,
            six: 123,
        };
    }
}
