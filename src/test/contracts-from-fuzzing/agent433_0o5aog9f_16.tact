struct Mix {
    one: Int;
    two: Bool?;
    three: String;
    four: Int?;
    five: Bool;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            one: 1,
            two: null,
            three: "3",
            four: null,
            five: true,
        };
    }
}