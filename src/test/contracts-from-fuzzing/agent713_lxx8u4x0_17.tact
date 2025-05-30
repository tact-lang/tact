struct Inner {
    id: Int;
}

struct Outer {
    inner: Inner?;
    name: String;
}

contract OptNestedMiddle {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            name: "hello"
        };
    }
}