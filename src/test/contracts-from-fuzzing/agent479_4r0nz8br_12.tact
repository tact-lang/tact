struct Foo {
    x: Int = 5;
    y: String?;
}

contract ParamStyle(
    a: Int,
    flag: Bool,
    item: Foo
) {
    // intentionally no init() and no extra fields
}