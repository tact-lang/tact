struct Inner {
    val: Int;
}

struct Outer {
    sub: Inner;
    name: String;
}

contract NestedStructs {
    data: Outer = Outer{ sub: Inner{ val: 7 }, name: "ok" };
}