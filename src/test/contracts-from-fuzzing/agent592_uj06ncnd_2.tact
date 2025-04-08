struct Nested {
    foo: Int;
    bar: Bool;
    baz: String;
    opt: Int?;
}

struct Outer {
    s: Nested;
    q: String;
    n: Int;
}

contract DeepStorage {
    a: Bool;
    b: Int;
    c: Outer;

    init() {
        self.a = true;
        self.b = 123;
        self.c = Outer{
            s: Nested{foo: 11, bar: false, baz: "hi", opt: null},
            q: "qqq",
            n: 99
        };
    }
}