struct Nested {
    foo: Int;
    bar: Bool?;
    baz: String;
}

struct Outer {
    one: Int;
    nested: Nested;
    flag: Bool;
}

contract TestPersist {
    data: Outer = Outer{
        one: 1,
        nested: Nested{foo: 2, bar: null, baz: "hello"},
        flag: false
    };
}
