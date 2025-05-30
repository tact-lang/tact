struct Inner {
    val: Int;
    opt: Int?;
}

struct Outer {
    inner: Inner;
    text: String;
}

contract NestedStructFieldTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ val: 42, opt: null },
            text: "hello"
        };
    }
}