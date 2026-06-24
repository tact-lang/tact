struct NestedStrings {
    s1: String;
    s2: String;
}

struct TopLevel {
    part1: NestedStrings;
    part2: NestedStrings;
}

contract ManyStringsTest {
    content: TopLevel;

    init() {
        self.content = TopLevel{
            part1: NestedStrings{s1:"one", s2:"two"},
            part2: NestedStrings{s1:"three", s2:"four"}
        };
    }
}