contract ParamsNested(
    nested: Nested
) {}

struct Nested {
    x: Int;
    y: Inner;
}

struct Inner {
    flag: Bool;
    note: String;
}
