struct Nested {
    id: Int;
    flag: Bool?;
}

contract TestContract(
    foo: Int,
    bar: Bool,
    baz: Nested,
    optStr: String?,
    deepOpt: Nested?,
) {}