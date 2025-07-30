struct Inner {
    val: Int = 7;
}

struct Wrapper {
    inner: Inner?;
}

contract Test {
    state: Wrapper?;
    init() {
        self.state = null;
    }
}