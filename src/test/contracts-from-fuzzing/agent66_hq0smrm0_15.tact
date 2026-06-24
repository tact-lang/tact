struct Combo {
    one: Int;
    two: Bool;
    three: String;
    four: Int?;
    five: Bool?;
    six: String?;
    seven: Nested;
}

struct Nested {
    val: Int;
    flag: Bool;
}

contract Test {
    c: Combo;
    init() {
        self.c = Combo{
            one: 1,
            two: false,
            three: "c",
            four: 4,
            five: null,
            six: null,
            seven: Nested{
                val: 7,
                flag: true,
            },
        };
    }
}
