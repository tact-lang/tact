struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    message: String;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{a: 5, b: true},
            message: "deep"
        };
    }
}