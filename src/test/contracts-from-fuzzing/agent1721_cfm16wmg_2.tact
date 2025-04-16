struct Inner {
    nestedBool: Bool;
    nestedInt: Int;
    nestedStr: String;
}

struct Outer {
    inner: Inner;
    anotherInt: Int;
}

contract C {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{
                nestedBool: true,
                nestedInt: 42,
                nestedStr: "nested",
            },
            anotherInt: 99,
        };
    }
}
