struct NestedStrings {
    s1: String;
    s2: String;
}

contract NestedStringStruct {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{ s1: "hi", s2: "hello" };
    }
}