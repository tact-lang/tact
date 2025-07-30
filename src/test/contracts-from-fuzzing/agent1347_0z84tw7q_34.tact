struct Inner {
    text: String?;
}

struct Wrapper {
    inner: Inner?;
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            inner: Inner{
                text: "Hello 👻"
            }
        };
    }
}