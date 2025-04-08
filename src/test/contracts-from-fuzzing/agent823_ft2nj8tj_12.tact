struct OptNested {
    optInner: Inner?;
}

struct Inner {
    val: Int;
}

contract NullableNested {
    data: OptNested;

    init() {
        self.data = OptNested{ optInner: null };
    }
}