struct SubNested {
    val: Int;
    flag: Bool;
}

struct Nested {
    sub: SubNested;
    txt: String;
    maybeBool: Bool?;
}

contract Test2 {
    nested: Nested;
    init() {
        self.nested = Nested{
            sub: SubNested{val: 2, flag: false},
            txt: "abc",
            maybeBool: null
        };
    }
}