struct OptNestInner {
    x: Int?;
    y: Bool?;
}

struct OptNestOuter {
    inner: OptNestInner?;
    s: String?;
}

contract OptionalNested {
    data: OptNestOuter?;

    init() {
        self.data = null;
    }
}