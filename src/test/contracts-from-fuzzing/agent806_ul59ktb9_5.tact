struct Inner {
    flag: Bool;
    text: String;
}

struct Outer {
    inner: Inner?;
    count: Int;
}

contract OptionalNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            count: 123
        };
    }
}