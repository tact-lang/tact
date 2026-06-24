struct Nested {
    a: Int;
    optS: String?;
    flag: Bool;
}

struct Container {
    id: Int;
    nested: Nested;
    text: String;
    bflag: Bool;
    amount: Int;
    optInner: Nested?;
}

contract ManyFields {
    rec: Container;

    init() {
        self.rec = Container{
            id: 1,
            nested: Nested{ a:2, optS: null, flag:true },
            text: "abc",
            bflag: false,
            amount: 999,
            optInner: null
        };
    }
}