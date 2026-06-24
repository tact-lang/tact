struct Nested {
    n: Int?;
    f: Bool?;
    s: String;
}

contract ParamContract(
    a: Int,
    b: Bool,
    c: String?,
    d: Nested,
    e: Nested?,
    f: Int?,
    g: Bool?,
    h: String?,
) {
  receive() {}
}