struct NestedStrings {
    s1: String;
    s2: String;
}

struct Wrapper {
    nested: NestedStrings;
}

contract NestedStringContract {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            nested: NestedStrings{
                s1: "abc",
                s2: "def"
            }
        };
    }
}
