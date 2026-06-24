struct StringNest {
    a: String;
    b: String?;
}

struct Containing {
    c: StringNest;
    d: StringNest?;
}

contract TestContract {
    val: Containing;

    init() {
        self.val = Containing{
            c: StringNest{
                a: "abc",
                b: null
            },
            d: null
        };
    }
}