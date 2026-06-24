struct Inception {
    inner: Int?;
    deep: Int?;
}

struct Layer2 {
    inc: Inception?;
}

contract NullDeep {
    l2: Layer2?;

    init() {
        self.l2 = null;
    }
}