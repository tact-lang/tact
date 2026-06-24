struct A {
    a: Int;
}

struct B {
    b: Int;
    opta: A?;
}

contract StructInStructOption(
    inner: B?,
    flag: Bool,
    text: String?,
) {
}