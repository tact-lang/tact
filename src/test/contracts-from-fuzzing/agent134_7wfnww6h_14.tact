struct Foo {
    bar: Int?;
}

struct Big {
    nested: Foo?;
    name: String;
}

contract ParamNested(
    value: Big,
) {}