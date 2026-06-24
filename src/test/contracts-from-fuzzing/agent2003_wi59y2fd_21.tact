struct Outer {
    flag: Bool;
    nested: Nested;
}

struct Nested {
    subflag: Bool;
    inneropt: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract TestC {
    st: Outer;

    init() {
        self.st = Outer{
            flag: true,
            nested: Nested{
                subflag: false,
                inneropt: Inner{
                    foo: 5,
                    bar: true,
                    baz: "x",
                },
            },
        };
    }
}
