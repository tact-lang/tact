struct InnerMost {
    val: Int?;
}

struct MidLevel {
    inner: InnerMost?;
}

struct TopLevel {
    mid: MidLevel?;
}

contract NullableNested {
    data: TopLevel;

    init() {
        self.data = TopLevel{mid: MidLevel{inner: InnerMost{val: null}}};
    }
}