// struct with optional string and cell fields nested
struct Inner {
    text: String?;
    blob: Cell?;
}

contract TestContract {
    inner: Inner;
    init() {
        self.inner = Inner{
            text: null,
            blob: emptyCell()
        };
    }
}