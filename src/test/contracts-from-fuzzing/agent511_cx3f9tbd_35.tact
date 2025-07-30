struct Inner {
    foo: Int?;
}

struct Outer {
    bar: Inner?;
}

contract NestParams(
    val: Outer?
) {}