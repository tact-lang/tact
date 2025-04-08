// optional struct inside optional struct, nested
struct Inner {
    text: String?;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    info: Outer?;

    init() {
        self.info = null;
    }
}