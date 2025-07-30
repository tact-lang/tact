struct Inner {
    x: Int;
    y: Bool?;
    msg: String?;
}

struct Outer {
    inner: Inner;
    comment: String;
}

contract TestContract {
    data: Outer = Outer{
        inner: Inner{ x: 42, y: null, msg: "hi" },
        comment: "test"
    };

    receive() {
        let _ = self.data.inner.x;
    }
}