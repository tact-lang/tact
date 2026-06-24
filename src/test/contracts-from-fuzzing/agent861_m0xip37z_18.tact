struct StringsNest {
    a: String;
    b: String?;
}

struct Second {
    nest: StringsNest;
}

contract NestedWithStrings {
    val: Second;

    init() {
        self.val = Second{
            nest: StringsNest{
                a: "hello",
                b: null,
            },
        };
    }
}
