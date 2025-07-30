struct Outer {
    s: String;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{
            s: "bar",
            inner: Inner{
                x: 123,
                y: false
            }
        };
    }
}