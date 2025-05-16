// Compose nested structs where ordering of fields changes nesting
struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    c: String;
    b: Bool;
    a: Int;
    inner: Inner;
}

contract Test {
    out: Outer = Outer{
        c: "outer",
        b: true,
        a: 10,
        inner: Inner{
            a: 1,
            b: false,
            c: "inner"
        }
    };
    init() {}
}