struct Inner {
    n: Int;
    flag: Bool;
}

struct Outer {
    text: String;
    inner: Inner;
    flag2: Bool;
}

contract NestedStructContract {
    field: Outer;

    init() {
        self.field = Outer{
            text: "hello",
            inner: Inner{ n: 123, flag: true },
            flag2: false
        };
    }
}