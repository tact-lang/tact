struct Inner {
    text: String;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ text: "Line1\nLine2\tTabbed\"Quoted\"" }
        };
    }
}