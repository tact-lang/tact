struct StringNest3 {
    gamma: String;
}

struct StringNest2 {
    beta: StringNest3;
}

struct StringNest1 {
    alpha: StringNest2;
}

contract NestedStrings {
    val: StringNest1;

    init() {
        self.val = StringNest1{
            alpha: StringNest2{
                beta: StringNest3{
                    gamma: "deep",
                },
            },
        };
    }
}