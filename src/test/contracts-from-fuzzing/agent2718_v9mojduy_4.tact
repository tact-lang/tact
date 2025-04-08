struct Inner {
    flag: Bool;
    val: Int?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String;
}

contract NullableNested {
    data: Outer = Outer{
        a: 42,
        b: Inner{ flag: true, val: null },
        c: "test",
    };
}