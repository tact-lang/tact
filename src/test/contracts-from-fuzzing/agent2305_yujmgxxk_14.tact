struct NestedWithString {
    s: String;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    number: Int;
}

contract TestNestedWithString {
    data: NestedWithString;

    init() {
        self.data = NestedWithString{
            s: "hello",
            inner: Inner{
                flag: true,
                number: 123
            }
        };
    }
}
