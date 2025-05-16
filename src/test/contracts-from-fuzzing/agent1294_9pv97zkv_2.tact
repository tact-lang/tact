struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Outer {
    foo: Int;
    bar: Inner;
}

contract NestedTest {
    data: Outer = Outer{
        foo: 7,
        bar: Inner{ val1: 1, val2: true }
    };
    receive() {}
}