struct Nested {
    foo: Int = 123;
}

struct Wrap {
    bar: Nested;
}

contract TestContract {
    s: Wrap = Wrap{
        bar: Nested{},
    };

    init() {}
}