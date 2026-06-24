struct Nested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    innerOpt: Int?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    count: Int;
    str: String;
    optNested: Nested?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                inner1: 1,
                inner2: true,
                inner3: "abc",
                innerOpt: null
            },
            flag: false,
            count: 42,
            str: "hello",
            optNested: null
        };
    }
}
