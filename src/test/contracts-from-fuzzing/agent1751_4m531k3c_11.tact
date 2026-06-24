struct InnerX {
    val: Int;
}

struct OuterY {
    inner: InnerX?;
}

contract NullNest {
    data: OuterY?;

    init() {
        self.data = null;
    }

    receive() {}
}