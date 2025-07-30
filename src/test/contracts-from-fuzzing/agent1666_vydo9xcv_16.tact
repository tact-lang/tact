struct Outer {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    foo: Int;
    bar: String;
    flag: Bool;
}

contract StructArrayTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ foo: 1, bar: "a", flag: true },
            inner2: Inner{ foo: 2, bar: "b", flag: false },
        };
    }
}