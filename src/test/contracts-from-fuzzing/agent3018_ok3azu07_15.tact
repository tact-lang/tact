struct Inner {
    x: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract MultipleNestedStructs {
    val: Outer = Outer {
        inner1: Inner{ x:1 },
        inner2: Inner{ x:2 },
        inner3: Inner{ x:3 },
    };
}
