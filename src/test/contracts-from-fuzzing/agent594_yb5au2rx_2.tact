struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    foo: Int;
    bar: Nested;
}

contract NestedStructContract {
    value: Outer = Outer{ foo: 1, bar: Nested{ a: 2, b: null } };
}