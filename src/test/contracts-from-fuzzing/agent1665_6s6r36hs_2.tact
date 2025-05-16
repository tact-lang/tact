struct Nested {
    foo: Int?;
}

struct Wrap {
    bar: Nested?;
}

contract TestContract {
    s: Wrap = Wrap{
        bar: null,
    };

    init() {}
}