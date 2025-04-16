struct ManyNestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
    f: Slice?;
}

struct Wrapper {
    inner: ManyNestedOptionals?;
}

contract MultiLevelOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper { inner: null };
    }
}