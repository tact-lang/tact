struct NestedStrings {
    first: String;
    second: LevelB;
}

struct LevelB {
    third: String;
    fourth: String;
}

contract NestedStringsContract {
    data: NestedStrings;
    init() {
        self.data = NestedStrings{
            first: "one",
            second: LevelB{ third: "two", fourth: "three" }
        };
    }
}