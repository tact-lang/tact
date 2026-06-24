// contract parameters: mixed nesting, optionals, multiple levels, no defaults
struct Last {
    z: Int;
    t: String;
}

struct Mid {
    inner: Last;
    label: String;
}

contract ComplexParams(
    foo: Int,
    bar: Mid,
    optBar: Mid?,
    baz: Last?,
) {
}
