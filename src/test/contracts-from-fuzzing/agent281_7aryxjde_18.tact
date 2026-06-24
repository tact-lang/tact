struct NestedStrings {
    a: String;
    b: String?;
}

struct StringBox {
    item: NestedStrings;
}

contract ManyStrings {
    s: StringBox;

    init() {
        self.s = StringBox{
            item: NestedStrings{ a: "foo", b: "bar" }
        };
    }
}