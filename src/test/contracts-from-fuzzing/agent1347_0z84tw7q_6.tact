struct Inner {
    text: String?;
}

struct Outer {
    inner: Inner?;
    number: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            number: 55
        };
    }
}