struct DeepInner {
    val: Int?;
}

struct MidInner {
    deep: DeepInner?;
}

struct Middle {
    mid: MidInner;
}

struct Top {
    inner: Middle?;
}

contract AltOptDeep {
    field: Top;

    init() {
        self.field = Top{ inner: null };
    }
}
