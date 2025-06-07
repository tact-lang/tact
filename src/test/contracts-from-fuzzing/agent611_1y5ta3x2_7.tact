struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    baz: String;
    nested: Inner;
    opt: Address?;
}

contract DeepParams(
    out: Outer,
) {}