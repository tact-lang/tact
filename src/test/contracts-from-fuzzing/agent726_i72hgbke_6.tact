struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

struct StrWrapper {
    val: String;
    nested: NestedStrings;
}

contract ManyStrings {
    payload: StrWrapper;

    init() {
        self.payload = StrWrapper{
            val: "a",
            nested: NestedStrings{
                s1: "b",
                s2: "c",
                s3: "d",
                s4: "e",
                s5: "f",
            },
        };
    }

    receive() {
        self.payload = self.payload;
    }
}