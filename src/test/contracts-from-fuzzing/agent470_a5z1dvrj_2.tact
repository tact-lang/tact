struct Inner {
    b: Bool = true;
    x: Int;
}

struct Outer {
    nested: Inner;
    flag: Bool?;  // optional with implicit default null
}

contract DeepOptionalTest {
    data: Outer = Outer{ nested: Inner{ x: 7 }, flag: null };

    init() {}
}