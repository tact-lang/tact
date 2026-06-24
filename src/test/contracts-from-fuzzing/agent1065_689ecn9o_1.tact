struct Inner {
    bar: Bool;
    num: Int;
}

contract NestedStructTest {
    rec: Inner;
    init() {
        self.rec = Inner{ bar: true, num: 123 };
    }
}