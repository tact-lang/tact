struct ComplexInner {
    flag: Bool;
    text: String;
    number: Int;
    isSet: Bool?;
}

struct ComplexOuter {
    inner: ComplexInner;
    amount: Int;
    status: Bool;
}

contract StorageTest {
    record: ComplexOuter;

    init() {
        self.record = ComplexOuter{
            inner: ComplexInner{
                flag: true,
                text: "Hello",
                number: 42,
                isSet: null,
            },
            amount: 100,
            status: false,
        };
    }
}