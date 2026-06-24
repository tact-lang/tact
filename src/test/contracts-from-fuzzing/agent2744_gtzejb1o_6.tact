struct NestedStrings {
    text: String;
}

struct Parent {
    nested: NestedStrings;
}

contract NestedStringInStructContract {
    data: Parent;

    init() {
        self.data = Parent{
            nested: NestedStrings{
                text: "test"
            }
        };
    }
}
