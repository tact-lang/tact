struct Sub2 {
    foo: Int?;
    bar: Bool?;
}

struct Sub1 {
    sub: Sub2?;
}

contract DeepParams(
    a: Sub1?,
    b: Sub2?,
    c: Int?,
    d: Bool,
    e: String?
) {}