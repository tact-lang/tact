struct Inner {
    value: Int;
    flag: Bool;
    note: String;
}

contract NestedStructTest {
    data: Inner;

    init() {
        self.data = Inner{
            value: 123,
            flag: true,
            note: "nested"
        };
    }
}