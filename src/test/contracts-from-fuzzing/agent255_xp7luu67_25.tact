message(42) EmptyMsg {}

struct Wrapper {
    inner: EmptyMsg;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: EmptyMsg{} };
    }
}