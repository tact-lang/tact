struct NestedStrings {
    str1: String;
    str2: String?;
    str3: String?;
}

struct Level2 {
    n: Int;
    nested: NestedStrings;
}

contract DeepStrings {
    storage: Level2;

    init() {
        self.storage = Level2{
            n: 7,
            nested: NestedStrings{
                str1: "Hello",
                str2: null,
                str3: "World"
            }
        };
    }
}