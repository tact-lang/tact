struct ManyNestedOptionals {
    x: Int?;
    y: Bool?;
    s: String?;
    inner: NestedInner?;
}

struct NestedInner {
    b: Bool?;
    a: Address?;
    c: Cell?;
}

contract Test21 {
    data: ManyNestedOptionals;

    init() {
        self.data = ManyNestedOptionals{
            x: null,
            y: null,
            s: null,
            inner: null,
        };
    }

    receive() {}
}