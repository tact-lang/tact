struct NestedStrings {
    a: String;
    b: Sub;
}

struct Sub {
    c: String;
    d: String?;
}

contract StringNest {
    val: NestedStrings;

    init() {
        self.val = NestedStrings{
            a: "hello",
            b: Sub{
                c: "world",
                d: null
            }
        };
    }
}