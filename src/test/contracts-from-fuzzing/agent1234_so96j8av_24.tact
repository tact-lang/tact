struct Nested {
    a: Int as uint64;
    b: Bool?;
}

contract ComplicatedParams(
    foo: Int as coins,
    bar: Bool?,
    baz: Nested?,
    qux: Address,
) {}