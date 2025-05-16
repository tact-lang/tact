struct InnerMost {
    x: Int;
}

struct Middle {
    val: InnerMost;
}

struct Outer {
    foo: Middle?;
}

contract OptWrap {
    data: Outer = Outer { foo: null };
}