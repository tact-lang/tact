struct SLevel {
    one: Int;
    two: Bool;
    three: String;
    four: Int?;
    five: Bool?;
    six: String?;
}

contract OptionalsNested {
    s: SLevel;

    init() {
        self.s = SLevel{
            one: 1,
            two: true,
            three: "t",
            four: null,
            five: null,
            six: null
        };
    }
}
