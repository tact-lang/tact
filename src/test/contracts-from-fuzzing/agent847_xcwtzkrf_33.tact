struct Wrap {
    field: InnerWrap;
}

struct InnerWrap {
    val: Int?;
}

contract OptionalWrap {
    x: Wrap?;

    init() {
        self.x = null;
    }
}