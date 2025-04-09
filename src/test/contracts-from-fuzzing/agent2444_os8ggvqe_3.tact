struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    message: String;
}

contract DeepNestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{a: 7, b: false},
            message: "hello"
        };
    }
}
