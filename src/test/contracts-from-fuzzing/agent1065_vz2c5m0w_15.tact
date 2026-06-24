struct NestedFieldsLong {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct Containing {
    inner1: NestedFieldsLong;
    inner2: NestedFieldsLong;
    flag: Bool;
}

contract NestedLongStruct {
    stuff: Containing;

    init() {
        self.stuff = Containing{
            inner1: NestedFieldsLong{
                a: 1, b: true, c: "abc",
                d: null, e: null, f: null
            },
            inner2: NestedFieldsLong{
                a: 2, b: false, c: "def",
                d: null, e: null, f: null
            },
            flag: true
        };
    }
}
