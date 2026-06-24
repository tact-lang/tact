// contract params: nested + optional
struct S {
    foo: Int?;
    bar: String;
}

contract HasParams(
    item: S,
    count: Int,
    tag: String?,
) {}