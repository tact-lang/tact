struct Nested {
    inner1: Int;
    inner2: Bool;
}

struct Middle {
    nested: Nested;
    optionalNum: Int?;
}

contract ComplexStorage {
    record: Middle;
    num: Int;
    ok: Bool;

    init() {
        self.record = Middle{
            nested: Nested{
                inner1: 13,
                inner2: false
            },
            optionalNum: null
        };
        self.num = 99;
        self.ok = true;
    }
}