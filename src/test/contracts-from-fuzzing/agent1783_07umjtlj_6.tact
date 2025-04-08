struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: Inner;
    text: String;
}

contract ParamNested(
    data: Outer,
) {
    receive() {
        let _ = self.data.inner.a;
        let _ = self.data.inner.b;
        let _ = self.data.text;
    }
}