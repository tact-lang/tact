struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    nested: Inner;
    optNested: Inner?;
    flag: Bool;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Inner{a: 1, b: true, c: "hello"},
            optNested: null,
            flag: false,
        };
    }
}