struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    inner: Inner;
    num: Int;
    flag: Bool;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 1,
                b: true,
                c: "test"
            },
            num: 42,
            flag: false
        };
    }
}