struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct OuterMost {
    middle: Middle;
    name: String;
    note: String?;
}

contract ManyStructs {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: Middle{
                inner: InnerMost{ a: 123, b: "str" },
                flag: true
            },
            name: "outer",
            note: null
        };
    }
}