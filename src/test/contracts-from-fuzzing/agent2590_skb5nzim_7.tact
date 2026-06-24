struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    deep: Deeper;
}

struct Deeper {
    val: Int;
}

contract OptionalDeep {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ inner: null };
    }
}