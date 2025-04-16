struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    number: Int;
    flag: Bool;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ value: 123 },
            number: 7,
            flag: true
        };
    }

    receive() {
        self.data.number += 1;
        self.data.flag = !self.data.flag;
        self.data.inner.value += 5;
    }
}