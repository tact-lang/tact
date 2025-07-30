struct Nested {
    q: Int;
    r: Bool;
}

struct Wrapper {
    nested: Nested;
    optNested: Nested?;
}

contract NestedStructContract {
    w: Wrapper = Wrapper{
        nested: Nested{q: 1, r: true},
        optNested: null
    };
}