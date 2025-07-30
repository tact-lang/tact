struct Inner {
    x: Int;
    y: String;
}

struct Middle {
    inner: Inner;
    text: String;
}

contract TestContract {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{x: 5, y: "hi"},
            text: "world"
        };
    }
}