struct Inner {
    s: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{}
        };
    }
}