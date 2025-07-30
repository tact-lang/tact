struct Deep {
    one: Int;
    two: String;
    three: Bool;
}

struct Mid {
    mid_val: Deep;
    check: Bool;
}

struct TopLevel {
    nested: Mid;
    count: Int;
}

contract MultinestTest {
    big: TopLevel;

    init() {
        self.big = TopLevel{
            nested: Mid{
                mid_val: Deep{
                    one: 1,
                    two: "nested",
                    three: false,
                },
                check: true,
            },
            count: 100,
        };
    }
}