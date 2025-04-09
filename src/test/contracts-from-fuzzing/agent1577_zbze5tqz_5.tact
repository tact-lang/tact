struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner?;
    label: String;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: null,
            label: "check"
        };
    }
}