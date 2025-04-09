struct Interesting {
    one: Int;
    two: Int?;
    three: Bool?;
    four: String;
    five: String?;
}

contract MixedNullability {
    val: Interesting = Interesting{
        one: 5,
        two: null,
        three: null,
        four: "hhh",
        five: null,
    };
}