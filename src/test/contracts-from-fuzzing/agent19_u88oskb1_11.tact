// deeply nested optionals inside struct
struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract Test {
    state: Outer?;

    init() {
        self.state = null;
    }
}