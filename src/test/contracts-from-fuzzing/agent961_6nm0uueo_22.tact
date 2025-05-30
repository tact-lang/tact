struct NestedStrings {
    msg1: String;
    msg2: String;
    msg3: String;
}

contract NestedStructWithStrings {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            msg1: "one", msg2: "two", msg3: "three"
        };
    }
}