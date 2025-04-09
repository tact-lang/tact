// optional deeply nested struct param with nested optional
struct Bottom {
    a: Int?;
}
struct Middle {
    b: Bottom?;
}
struct Top {
    c: Middle?;
}

contract ParamsNestedOpt(
    p: Top?
) {}