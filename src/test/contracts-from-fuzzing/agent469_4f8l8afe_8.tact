struct Inner {
    x: Int;
    y: Bool?;
}

contract ParamsContract(
    foo: Int,
    bar: String,
    baz: Bool?,
    compound: Inner?,
) {}
