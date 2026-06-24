struct HasStrings {
    s: String;
}

struct HasNestedStrings {
    n: HasStrings;
}

contract NestedStringTest {
    data: HasNestedStrings;

    init() {
        self.data = HasNestedStrings{
            n: HasStrings{ s: "nested" }
        };
    }
}