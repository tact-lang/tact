struct Inner {
    value: Int;
    flag: Bool;
    note: String;
}

contract NestedTest {
    inner: Inner;
    num: Int;

    init() {
        self.inner = Inner{
            value: 77,
            flag: true,
            note: "hello"
        };
        self.num = 99;
    }
}